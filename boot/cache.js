var fs = require('fs-extra');
var lib = require('../lib');
var path = require('path');

fs.removeSync(CACHE_DIR);
lib.cache.dir = CACHE_DIR;
lib.cache.sass.add(STATIC_DIR);

fs.ensureDir(path.join(CACHE_DIR, 'templates_c'));