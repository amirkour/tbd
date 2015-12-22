module.exports = function(grunt) {

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-browserify');

    grunt.initConfig({

        // will provide linting and build-time hints/errors/warnings
        // for the specified js files
        'jshint': {
            'files': ['Gruntfile.js', 'app.js', 'src/**/*.js', 'test/**/*.js']
        },

        // pack-up CJS-style modules into a bundle that'll get loaded/used
        // in the browser
        'browserify':{
            'default':{
                'src': 'src/graph-browser.js',
                'dest': 'public/bundle.js'
            }
        },

        // run 'grunt watch' to run the specified tasks over the specified
        // files - will keep the grunt process running in the background.
        'watch': {
            'files': ['<%= jshint.files %>'],
            'tasks': ['default']
        }
    });

    grunt.registerTask('default', ['jshint','browserify']);
};
