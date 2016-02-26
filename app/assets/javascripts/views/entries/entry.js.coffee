class Bookmycinema.Views.Entry extends Backbone.View

  template: JST['entries/entry']
  tagName:'li'

  events:
    'click .delete':'removeEntry'
    'dblclick .entryli': 'editEntry'
    'keyup .edit_entry': 'updateEntry'

  initialize: ->
    @.model.on("destroy", this.remove, this);
    @.model.on("change",@render,@)
  
  render: ->
    $(@el).html(@template(entry: @model))
    @

  removeEntry: (event) ->  
    event.preventDefault
    @model.destroy()

  editEntry: (event) ->
    event.preventDefault    
    $(@el).html('<input type="text" class="form-control edit_entry" value="' + @model.get('name') + '">')
    
  updateEntry: (event) ->
    event.preventDefault
    @model.save({name: event.currentTarget.value}) if event.keyCode == 13