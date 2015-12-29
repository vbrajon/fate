module.exports = (done) ->
  waitForAngular = (done) ->
    return done() unless window.angular
    try
      angular
      .element('html')
      .injector()
      .get('$browser')
      .notifyWhenNoOutstandingRequests done
    catch e
      done e

  browser
  .timeoutsAsyncScript 20000
  .executeAsync waitForAngular
  .call done
