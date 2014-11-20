var fs = require('fs-extra');
var path = require('path');


module.exports = {
	site: require('./site.json'),
	page: require('./page.json'),
	menu: require('./menu.json'),
	common_js: fs.readFileSync(path.join(__dirname, 'common_js.html')).toString()
};