var exec = require('child_process').exec;
var fs = require('fs');
var npm = require('npm');
var path = require('path');

// The version of Persona Theme that this theme is based on / modifies
var personaVersion = '2.1.12';

// Install that version of Persona theme, and copy all of its templates into our templates directory
// The templates already existing (i.e., the ones we modified), however, will not be overwritten (-n)
npm.load(function () {
    return npm.commands.install('dedupe', ['nodebb-theme-persona@' + personaVersion], function () {
        var cmd = 'cp -r -n ./dedupe/node_modules/nodebb-theme-persona/templates/* ./templates';
        console.log(cmd)
        exec(cmd);
    });
});
