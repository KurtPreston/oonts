# Load all required libraries.
gulp       = require 'gulp'
bourbon    = require 'node-bourbon'
cssmin     = require 'gulp-cssmin'
coffee     = require 'gulp-coffee'
jade       = require 'gulp-jade'
install    = require 'gulp-install'
sass       = require 'gulp-sass'
uglify     = require 'gulp-uglify'

gulp.task 'css', ->
  gulp.src 'src/*.scss'
    .pipe sass(
      includePaths: require('node-bourbon').includePaths
    )
    .pipe cssmin keepSpecialComments: 0
    .pipe gulp.dest 'dist'

gulp.task 'js', ->
  gulp.src 'src/*.coffee'
    .pipe coffee()
    .pipe uglify()
    .pipe gulp.dest 'dist'

gulp.task 'html', ->
  gulp.src 'example/*.jade'
    .pipe jade(pretty: true)
    .pipe gulp.dest 'example'

gulp.task 'install', ->
  gulp.src([
    './bower.json'
    './package.json'
  ])
  .pipe(install())

# Default task call every tasks created so far.
gulp.task 'default', ['install', 'css', 'js', 'html']
