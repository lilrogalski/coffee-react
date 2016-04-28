gulp = require 'gulp'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
watchify = require 'watchify'
browserify = require 'browserify'
connect = require 'gulp-connect'
cjsx = require 'gulp-cjsx'
sass = require 'gulp-sass'
postcss = require 'gulp-postcss'
autoprefixer = require 'autoprefixer'
cssnano = require 'cssnano'

gulp.task 'server', ->

  connect.server
    root: 'public'
    port: 3001
    livereload: true


gulp.task 'js', ->

  bundler = watchify browserify
    cache: {}
    packageCache: {}
    fullPaths: true
    entries: ['./app/scripts/index.cjsx']
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
  .pipe connect.reload()

gulp.task 'watch-js', ['js'], ->
  gulp.watch ['./app/scripts/**'], ['js']

gulp.task 'css', ->
  processors = [
    autoprefixer
    cssnano
  ]
  gulp
    .src './app/styles/*.sass'
    .pipe(sass().on('error', sass.logError))
    .pipe(postcss(processors))
    .pipe gulp.dest './public'
    .pipe connect.reload()

gulp.task 'watch-sass', ->
  gulp.watch './app/styles/*.sass', [ 'css' ]

gulp.task 'default', ['server', 'watch-js', 'watch-sass']

gulp.task 'heroku', ->
  connect.server
    root: 'public'
    port: process.env.PORT or 5000
    livereload: false
