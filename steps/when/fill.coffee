module.exports = ->
  @when /^I fill $element with $string$/, (element, value, done) ->
    browser
    .setValue element, value
    .call done

  @when /^I submit $element$/, (element, done) ->
    browser
    .submitForm element
    .call done

  @when /^I submit $element with$matrix$/, (element, matrix, done) ->
    steps = matrix.map (line) ->
      "And I fill #{line[0]} with #{line[1]}"
    steps.push "And I submit '#{element}'"
    yadda.run steps, done
