module.exports = ->
  @when /^I fill $element with $string$/, (element, value, done) ->
    browser
    .setValue element, value
    .call done

  @when /^I fill the form $element with$matrix$/, (element, matrix, done) ->
    steps = matrix.map (line) ->
      "And I fill #{line[0]} with #{line[1]}"
    steps.push "And I submit the form '#{element}'"
    yadda.run steps, done

  @when /^I submit the form $element$/, (element, done) ->
    browser
    .submitForm element
    .call done
