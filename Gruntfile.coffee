module.exports = (grunt) ->

    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-browserify'

    grunt.initConfig
        jshint:
            files: ['Gruntfile.js', 'app.js', 'src/**/*.js', 'test/**/*.js']

        browserify:
            default:
                src: 'src/graph-browser.js'
                dest: 'public/bundle.js'

        watch:
            files: ['<%= jshint.files %>'],
            tasks: ['default']

    grunt.registerTask 'default', ['jshint','browserify']
