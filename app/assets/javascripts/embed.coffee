#= depend_on helpers/md5
#= depend_on polyfills/object_keys

class FlippinAds
  images: {}

  constructor: (@domain, @site_key = '') ->
    $('img').each -> @register(new Image($(this), self))

  getImageHashes: -> @images.keys()
  register: (image) -> @images[image.getHash()] = image

  fetchImageData: (cb) ->
    $.post("#{@domain}/channels/#{@site_key}/images", hashes: @getImageHashes())
     .done (@data) => cb()


class Image
  constructor: (@image, @flippin_ads) ->
    return unless @isEligable()
    @addEventListeners()

  getHash: -> md5(@image.attr('src'))
  isEligable: -> @image.height() >= 300 && @image.width() >= 300

  addEventListeners: ->
    @image.on 'mouseover', @show()
    @image.on 'mouseout', @hide()

  show: =>
    @flippin_ads.getImageData(this)

# Bind to root object
this.__fa = FlippinAds
