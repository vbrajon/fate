module.exports = ->
  @when /^I go fullscreen$/, (done) ->
    browser
    .windowHandleMaximize()
    .call done

  @when /^I set the (page|window) size to $string$/, (type, size, done) ->
    mode = type == 'page'
    size =
      width: parseInt size.split('x')[0], 10
      height: parseInt size.split('x')[1], 10
    browser
    .setViewportSize size, mode
    .call done
