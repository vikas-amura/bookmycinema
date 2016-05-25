class Bookmycinema.Views.Entry extends Backbone.View

  template: JST['entries/entry']
  tagName:'li'

  events:
    'click .delete':'removeEntry'
    'dblclick .entryli': 'editEntry'
    'keyup .edit_entry': 'updateEntry'

  initialize: ->
    @.model.on("change",@render,@)
  
  render: ->
    $(@el).html(@template(entry: @model))
    @

  removeEntry: (event) ->  
    event.preventDefault
    @model.destroy()

  editEntry: (event) ->
    window.prev_view.render() if $.find('.edit_entry').length == 1
    window.prev_view = @    
    $(@el).html('<input type="text" class="form-control edit_entry" value="' + @model.get('name') + '">')
    
  updateEntry: (event) ->
    @model.save({name: event.currentTarget.value}) if event.keyCode == 13