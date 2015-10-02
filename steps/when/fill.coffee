module.exports = ->
  @when /^I fill $element with $string$/, (element, value, done) ->
    browser
    .setValue element, value
    .call done

  @when /^I fill the form $element with\n$table$/, (element, table, done) ->
    steps = table.map (item) ->
      "And I fill '#{item.element}' with \"#{item.value}\""
    steps.push "And I submit the form '#{element}'"

    yadda.run steps, done

  @when /^I submit the form $element$/, (element, done) ->
    browser
    .submitForm element
    .call done
