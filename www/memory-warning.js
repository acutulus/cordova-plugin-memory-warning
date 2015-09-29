var cordova = require('cordova');

/**
 * Memory Warning plugin for Cordova
 * 
 * @constructor
 */
function MemoryWarning () {}

/**
 * Sets the callback for a memory warning
 *
 * @param {Function} callback  The function to call in case of a memory warning
 */
MemoryWarning.prototype.register = function (callback) {
  cordova.exec(callback, function(){}, "MemoryWarning", "registerCallback", []);
};

// Register the plugin
var memorywarning = new MemoryWarning();
module.exports = memorywarning;
