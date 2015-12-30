module.exports = (grunt) ->

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-browserify'

    grunt.initConfig
        jshint:
            files: ['Gruntfile.js', 'lib/**/*.js', 'test/**/*.js']

        browserify:
            default:
                src: 'src/graph-browser.js'
                dest: 'public/bundle.js'

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

    # grunt.registerTask 'default', ['coffee', 'jshint', 'browserify']
    grunt.registerTask 'default', ['coffee', 'browserify']
