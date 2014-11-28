var express = require('express');
var directory = require('serve-index');

app.use(directory(WORK_DIR, {icons: true, view: 'details'}));
app.use(express.static(WORK_DIR));
app.use(express.static(STATIC_DIR));
app.use(express.static(CACHE_DIR));