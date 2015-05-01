# Load all required libraries.
gulp       = require 'gulp'
bourbon    = require 'node-bourbon'
coffee     = require 'gulp-coffee'
sass       = require 'gulp-sass'
cssmin     = require 'gulp-cssmin'
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

# Default task call every tasks created so far.
gulp.task 'default', ['css', 'js']
