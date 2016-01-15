module.exports = (done) ->
  browser
  .init()
  .timeoutsAsyncScript config.timeout
  .call done
