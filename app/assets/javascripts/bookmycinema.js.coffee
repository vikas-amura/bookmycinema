window.Bookmycinema =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Bookmycinema.Routers.Entries()
  	Backbone.history.start(pushState: true)

$(document).ready ->
  Bookmycinema.initialize()
