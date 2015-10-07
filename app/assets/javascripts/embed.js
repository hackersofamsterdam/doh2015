window.__monie_penny = (function () {
  "use strict";

  function MoniePenny(site_id) {
    MoniePenny.site_id = site_id;
    fetchImages();
    addEventListeners();
  }

  /** @type {string} */
  MoniePenny.site_id = null;

  /** @type {jQuery} */
  MoniePenny.images = null;

  var addEventListeners = function () {
    MoniePenny.images.on('hover.moniepenny')
  };

  var fetchImages = function (el) {
    MoniePenny.images = el.getElementsByTagName('img');
  };

  return MoniePenny;
})();
