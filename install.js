var exec = require('child_process').exec;
var fs = require('fs');
var npm = require('npm');
var path = require('path');

var version = JSON.parse(fs.readFileSync('./package.json')).version;

npm.load(function () {
    return npm.commands.install('dedupe', ['nodebb-theme-persona@' + version], function () {
        var cmd = 'cp -r -n ./dedupe/node_modules/nodebb-theme-persona/templates/* ./templates';
        console.log(cmd)
        exec(cmd);
    });
});
