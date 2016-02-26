class Bookmycinema.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index'],
  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    @collection.on('add',@apendEntry,this)

  render: ->
    $(@el).html(@template())
    @collection.each(@apendEntry, @)
    this

  apendEntry: (entry) ->
    view = new Bookmycinema.Views.Entry(model: entry)
    @$el.find("#entries_list").prepend(view.render().el)


  createEntry: (event) ->
    event.preventDefault()
    model = @collection.create({name: @$el.find("#new_entry_name").val()})
    $("#new_entry")[0].reset()
