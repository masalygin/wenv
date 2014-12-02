var gulp = require('gulp');
var browserify = require('gulp-browserify');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');

gulp.task('liverload', function() {

	var dir = './resources/static/wenv/';

	return gulp.src(dir + 'livereload.js')
		.pipe(browserify())
		.pipe(uglify())
		.pipe(rename({
			suffix: '.min'
		}))
		.pipe(gulp.dest(dir));

});