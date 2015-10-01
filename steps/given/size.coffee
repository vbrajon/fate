module.exports = ->
  @given /^I maximize$/, (done) ->
    browser
    .windowHandleMaximize()
    .call done

  @given /^I set size to $string$/, (constant, done) ->
    browser
    .setViewportSize size, true
    .call done
