# Load all required libraries.
gulp       = require 'gulp'
bourbon    = require 'node-bourbon'
cssmin     = require 'gulp-cssmin'
coffee     = require 'gulp-coffee'
jade       = require 'gulp-jade'
install    = require 'gulp-install'
sass       = require 'gulp-sass'
uglify     = require 'gulp-uglify'
watch      = require 'gulp-watch'

files =
  scss: 'src/*.scss'
  coffee: 'src/*.coffee'
  jade: 'example/src/*.jade'
  example_scss: 'example/src/*.scss'

gulp.task 'css', ->
  gulp.src files.scss
    .pipe sass(
      includePaths: bourbon.includePaths
    )
    .pipe cssmin keepSpecialComments: 0
    .pipe gulp.dest 'dist'

  gulp.src files.example_scss
    .pipe sass(
      includePaths: bourbon.includePaths
    )
    .pipe gulp.dest 'example'

gulp.task 'js', ->
  gulp.src files.coffee
    .pipe coffee()
    .pipe uglify()
    .pipe gulp.dest 'dist'

gulp.task 'html', ->
  gulp.src files.jade
    .pipe jade(pretty: true)
    .pipe gulp.dest 'example'

gulp.task 'install', ->
  gulp.src([
    './bower.json'
    './package.json'
  ])
  .pipe(install())

gulp.task 'watch', ->
  watch(files.scss, -> gulp.start('css'))
  watch(files.example_scss, -> gulp.start('css'))
  watch(files.coffee, -> gulp.start('js'))
  watch(files.jade, -> gulp.start('html'))

# Default task call every tasks created so far.
gulp.task 'default', ['install', 'css', 'js', 'html', 'watch']
