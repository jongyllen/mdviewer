var gulp = require('gulp');
var elm = require('gulp-elm');
var gutil = require('gulp-util');
var plumber = require('gulp-plumber');
var connect = require('gulp-connect');

// File paths
var paths = {
  dest: 'dist',
  elm: 'src/App.elm',
  allelm: 'src/*.elm',
  static: 'src/static/*.{html,css}',
  docs: 'private_documents/*.{md,json}'
};

// Init Elm
gulp.task('elm-init', elm.init);

// Compile Elm
gulp.task('elm', ['elm-init'], function(){
    return gulp.src(paths.elm)
        .pipe(plumber())
        .pipe(elm())
        .pipe(gulp.dest(paths.dest));
});

// Move static assets to dist
gulp.task('static', function() {
    return gulp.src(paths.static)
        .pipe(plumber())
        .pipe(gulp.dest(paths.dest));
});

gulp.task('docs', function() {
    return gulp.src(paths.docs)
        .pipe(plumber())
        .pipe(gulp.dest(paths.dest + '/documents'));
});

// Watch for changes and compile
gulp.task('watch', function() {
     gulp.watch(paths.allelm, ['elm']);
     gulp.watch(paths.static, ['static']);
     gulp.watch(paths.docs, ['docs']);
});

// Local server
gulp.task('connect', function() {
    connect.server({
        root: 'dist',
        port: 3000
    });
});

// Main gulp tasks
gulp.task('build', ['elm', 'static', 'docs']);
gulp.task('default', ['connect', 'build', 'watch']);
