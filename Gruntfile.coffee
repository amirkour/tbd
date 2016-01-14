module.exports = (grunt) ->

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-browserify'
    grunt.loadNpmTasks 'grunt-contrib-concat'

    grunt.initConfig
        jshint:
            files: ['Gruntfile.js', 'lib/**/*.js', 'test/**/*.js']

        browserify:
            default:
                src: 'src/graph-browser.js'
                dest: 'public/bundle.js'

        concat:
            spa:
                src: [
                    'public/jquery-2.1.4.min.js'
                    'public/underscore-1.8.3.min.js'
                    'public/handlebars-v4.0.5.js'
                    'public/underscore-1.8.3.min.js'
                    'public/backbone-1.2.3.min.js'
                    'public/marionette-2.4.4.min.js'
                    'public/bundle.js'
                ]
                dest: 'public/spa-bundle.js'


        watch:
            files: ['<%= jshint.files %>'],
            tasks: ['default']

        coffee:
            default:

                # see the section in grunt's documentation on 'building the files object dynamically'
                # for notes on how to compile multiple coffeescript files one-to-one to their js output
                files: [
                    expand: true
                    cwd: './src'
                    src: '**/*.coffee'
                    dest: 'lib/'
                    ext: '.js'
                ]

    # note: browserify has to come before concat, so that the browser-bound
    # js bundles are ready to be concatenated
    grunt.registerTask 'default', ['coffee', 'browserify', 'concat:spa']
