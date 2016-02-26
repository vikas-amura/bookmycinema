class Bookmycinema.Routers.Entries extends Backbone.Router

  routes:
    '': 'index'
    'entries/:id': 'show'    

  initialize: ->
    @collection = new Bookmycinema.Collections.Entries()
    @collection.fetch()

  index: ->
    view = new Bookmycinema.Views.EntriesIndex(collection: @collection)
    $("#container").html(view.render().el)

  show: (id) ->
    view = new Bookmycinema.Views.EntriesShow(entries: @collection.get(id))
    $("#container").html(view.render().el)
    view.initializeEditorOnTextArea()


