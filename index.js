'use strict';

var _ = require('lodash');
var nconf = module.parent.require('nconf');
var Promise = require('bluebird');
var request = require('request');

Promise.promisifyAll(request);

var e = {};

var url = nconf.get('websites:r1:url');

var getHeader = _.throttle(function () {
    return request.getAsync(url + '/partials/header').timeout(2000)
        .spread(function (response, body) {
            if (response.statusCode != 200) throw new Error();

            return body;
        })
        .catch(function (err) {
            getHeader.cancel();
            return '';
        });
}, 1000 * 60 * 60);

var getFooter = _.throttle(function () {
    return request.getAsync(url + '/partials/footer').timeout(2000)
        .spread(function (response, body) {
                if (response.statusCode != 200) throw new Error();

                return body;
            })
        .catch(function () {
            getFooter.cancel();
            return '';
        });
}, 1000 * 60 * 60);

e.renderHeader = function (data, callback) {

    return Promise.join(getHeader(), getFooter(), function (header, footer) {
        data.templateValues.r1Header = header;
        data.templateValues.r1Footer = footer.replace(/loginFpp/g, 'login?local=1');
       
        callback(null, data);
    })
    .catch(function () {
        callback(null, data);
    });
    
};

module.exports = e;
