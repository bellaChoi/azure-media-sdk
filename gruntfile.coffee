module.exports = (grunt) ->
  # load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  # load package config


  taskConfig = 
    watch:
      coffee:
        files: ['lib/src/**/*.coffee']
        tasks: ['coffee:watch']
        options:
          events: 'all'
          spawn: false

    clean:
      default: 'app/assets'
      dist: [
        'dist/azure-media-sdk.min.js'
        'dist/azure-media-sdk.min.js.map'
      ]

    coffee:
      options:
        sourceMap: true

      watch:
        options:
          sourceMap: true

        files:
          [
            {
              expand: true
              cwd: 'lib/src'
              src: '**/*.coffee'
              dest: 'lib/assets/src'
              ext: '.js'
            }
          ]

    connect:
      server:
        options:
          port: 8000
          hostname: '*'
          base: '.'

    requirejs:
      options:
        generateSourceMaps: true
        preserveLicenseComments: false
        # https://www.evernote.com/l/ACi-gWuUmp1Gr4p725DVVgCLRrVvfdzhBhk
        removeCombined: true 
        findNestedDependencies: true
        useStrict: true
        optimize: 'none'
        # optimize: 'uglify2'
        uglify2:
          compress:
            global_defs:
              DEBUG: false
              LOG_THRESHOLD: 0 # 4: all, 3: info, 2: debug, 1: error, 0: none
            dead_code: true
      lib:
        options:
          mainConfigFile: 'lib/assets/src/config.js'
          baseUrl: 'lib/assets/src'
          out: 'dist/azure-media-sdk.min.js'
          onBuildRead: (moduleName, path, contents) ->
            return contents.replace /\/assets/g, '/dist'
          include: ['../almond', 'sdk', 'token']
          exclude: ['jquery', 'lodash']
          wrap: {
            startFile: 'lib/assets/wrap-start.js'
            endFile: 'lib/assets/wrap-end.js'
          }

    nodemon:
      options:
        args: ['development']
        nodeArgs: ['--debug']
        watch: [
            'lib',
            '.'
        ]
        legacyWatch: true

      # nodemon.test
      test:
        script: 'tests/test.js'
        options:
          callback: (nodemon) ->
            nodemon.on 'log', (evt) ->
              console.log evt.colour

            nodemon.on 'restart', () ->
              console.log 'restart test.'



  grunt.initConfig taskConfig

  grunt.registerTask 'default', ->
    grunt.task.run [
      'coffee:watch'
      'connect:server'
      'watch'    
    ]

  grunt.registerTask 'server', 'server', [
    'nodemon:test'
  ]

  grunt.registerTask 'build', 'build', [
    'clean:dist'

    'coffee:watch'
    'requirejs'
  ]