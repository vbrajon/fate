module.exports = ->
  @given /^I am on the homepage$/, (done) ->
    @browser.url @BASE_URL, done

  @given /^I am on "$string"$/, (path, done) ->
    if /^http/.test path
      url = path
    else
      url = @BASE_URL + path

    @browser.url url, done
