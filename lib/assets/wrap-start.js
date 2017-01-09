/**
 * azure-media-sdk module.
 * v1.0.0
 * https://github.com/madsquare/azure-media-sdk.git
**/
(function (root, factory) {
  if (typeof define === 'function') {
    define(['jquery', 'lodash'], factory);
  } else if (typeof exports === 'object') {
    module.exports = factory();
  } else {
    root.AzureMedia = factory();
  }
}(this, function () {