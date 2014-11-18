var fs = require('fs');


function Collector(options) {

	for (var i in options) {
		this[i] = options[i];
	}

	this.cache = {};
	this.load({}, this.main);

}


Collector.prototype.label = '@__fcollector__';
Collector.prototype.success = function() {};
Collector.prototype.error = function() {};
Collector.prototype.ignoreNonexistent = true;


Collector.prototype.load = function (sub, filepath, include, isAlt) {

	var self = this;
	var path = isAlt ? sub.altpath : filepath

	if (this.cache[filepath] && !isAlt) {
		return;
	}

	this.cache[filepath] = true;

	fs.readFile(path, 'utf8', function (err, data) {

		if (err) {

			if (sub.altpath && path !== sub.altpath) {

				self.load(sub, filepath, include, true);
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
					self.load(data.sub[i], data.sub[i].filepath, data.sub[i].include);
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