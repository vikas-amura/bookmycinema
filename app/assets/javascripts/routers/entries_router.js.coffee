class Bookmycinema.Routers.Entries extends Backbone.Router

  routes:
    '': 'index'
    'entries': 'index'

  initialize: ->
    @collection = new Bookmycinema.Collections.Entries()
    @collection.fetch()

  index: ->
    view = new Bookmycinema.Views.EntriesIndex(collection: @collection)
    $("#container").html(view.render().el)

