"use strict";

exports.hear = function(regex) {
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

exports.respond = function(regex) {
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
