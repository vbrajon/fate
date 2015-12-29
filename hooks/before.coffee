module.exports = (done) ->
  browser
  .init()
  .timeoutsAsyncScript program.timeout
  .call done
