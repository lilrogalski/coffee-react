gulp = require 'gulp'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
watchify = require 'watchify'
browserify = require 'browserify'
connect = require 'gulp-connect'
sass = require 'gulp-sass'
sourcemaps = require('gulp-sourcemaps')


gulp.task 'server', ->

  connect.server
    root: 'public'
    port: 3000
    reload: true


gulp.task 'watch-js', ->

  bundler = watchify browserify
    cache: {}
    packageCache: {}
    fullPaths: true
    entries: ['./app/scripts/index.coffee']
    extensions: ['.coffee', '.cjsx']
    debug: true

  bundle = ->

    gutil.log 'building scripts'
    start = new Date

    bundler
      .bundle()
      .on 'error', (e) -> gutil.log "#{e}"
      .pipe source 'index.js'
      .pipe gulp.dest './public/'
      .pipe connect.reload()
      .on 'end', ->
        gutil.log "built scripts in #{new Date - start}ms"

  bundler.on 'update', bundle
  bundle()



gulp.task 'sass', ->
  gulp
    .src './app/styles/index.sass'
    .pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
    .pipe(sourcemaps.write())
    .pipe gulp.dest './public'

gulp.task 'sass:watch', ->
  gulp.watch './app/styles/index.sass', [ 'sass' ]


gulp.task 'default', ['server', 'watch-js', 'sass:watch']

gulp.task 'heroku', ->
  connect.server
    root: 'public'
    port: process.env.PORT or 5000
    livereload: false