module.exports = ->
  @when /^I click on "$string"$/, (element, done) ->
    @browser
    .click element
    .call done

  @when /^I click on "$string" in block containing "$string"$/, (text, block, done) ->
    selection = xpath """//*[text()="#{block}"]/..//*[text()="#{text}"]"""
    selection.click().then done
