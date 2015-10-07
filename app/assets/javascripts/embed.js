window.__money_penny = (function () {
  "use strict";

  function MoneyPenny(site_id) {
    this.site_id = site_id;

    this.images = findAllImages(document.body);
  }

  function findAllImages(el) {
    return el.getElementsByTagName('img');
  }

  return MoneyPenny;
})();
