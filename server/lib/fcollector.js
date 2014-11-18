var fs = require('fs');


function Collector(options) {

	for (var i in options) {
		this[i] = options[i];
	}

	this.cache = {};
	this.load({
		filepath: this.main
	});

}


Collector.prototype.label = '@__fcollector__';
Collector.prototype.success = function() {};
Collector.prototype.error = function() {};
Collector.prototype.ignoreNonexistent = true;


Collector.prototype.load = function (sub, isAlt) {

	var self = this;
	var filepath = sub.filepath;
	var altpath = sub.altpath;
	var path = isAlt ? altpath : filepath;
	var include = sub.include;

	if (this.cache[filepath] && !isAlt) {
		return;
	}

	this.cache[filepath] = true;

	fs.readFile(path, 'utf8', function (err, data) {

		if (err) {

			if (altpath && path !== altpath) {

				self.load(sub, true);
				return;

			} else {

				if (self.ignoreNonexistent && include) {
					self.cache[filepath] = {data: include};
				} else {
					self.error(err);
					self.cache[filepath] = {data: ''};
				}

			}

		} else {

			data = self.pipe(data, filepath);

			if (data.sub) {

				for (var i = 0, len = data.sub.length; i < len; i++) {
					self.load(data.sub[i]);
				}

			}

			self.cache[filepath] = data;
		}

		if (self.isResolved()) {
			self.build();
		}

	});

};


Collector.prototype.isResolved = function () {

	for (var i in this.cache) {

		if (this.cache[i] === true) {
			return false;
		}

	}

	return true;

};


Collector.prototype.build = function () {

	var self = this;

	function build(data) {

		var res = data.data;

		if (!data.sub) {
			return res;
		}

		for (var i = 0, len = data.sub.length; i < len; i++) {
			var sub = build(self.cache[data.sub[i].filepath]);
			res = res.replace(self.label + data.sub[i].filepath, sub);
		}

		return res;

	}

	var res = build(this.cache[this.main]);

	this.success(res);

};

module.exports = Collector;