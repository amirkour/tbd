module.exports = function(grunt) {

    grunt.loadNpmTasks('grunt-contrib-jshint');

    grunt.initConfig({
        'jshint': {
            'files': ['Gruntfile.js', 'app.js', 'src/**/*.js']
        }
    });

    // A very basic default task.
    grunt.registerTask('default', 'Firing up the default task!', ['jshint']);
};
