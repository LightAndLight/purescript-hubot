"use strict";

exports.http = function(url) {
    return function(robot) {
        return function() {
            robot.http(url);
        }
    };
};

exports.matchInternal = function(just) {
    return function(nothing) {
        return function(response) {
            return function(i) {
                var res = response.match[i];
                if (res === undefined) {
                    return nothing;
                } else {
                    return just(res);
                }
            };
        };
    };
};

exports.hearInternal = function(regex) {
    return function(callback) {
        return function(robot) {
            return function() {
                robot.hear(regex,function(res) {
                    callback(res)();
                });
            };
        };
    };
};

exports.respondInternal = function(regex) {
    return function(callback) {
        return function(robot) {
            return function() {
                robot.respond(regex,function(res) {
                    callback(res)();
                });
            };
        };
    };
};

exports.send = function(str) {
    return function(res) {
        return function() {
            res.send(str);
        };
    };
};

exports.reply = function(str) {
    return function(res) {
        return function() {
            res.reply(str);
        };
    };
};
