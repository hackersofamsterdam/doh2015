class FlippinAds
  constructor: (@site_key = '') ->
    $('img').each -> new Image($(this), self)

class Image
  constructor: (@image, @flipping_ads) ->
    return unless @is_eligable()

  is_eligable: -> @image.height() >= 300 && @image.width() >= 300
  add_event_listeners: ->
    @image.on 'mouseover', @on_mouseover
    @image.on 'mouseout', @on_mouseout

  on_mouseover: => @image.addClass('fa-image__hover')
  on_mouseout: => @image.removeClass('fa-image__hover')

# Bind to root object
this.__fa = FlippinAds
