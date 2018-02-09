Todoapp.Views.TodoItemView = Backbone.View.extend

  template: JST["backbone/templates/todo_item"]

  tagName: 'li'

  initialize: ->
    console.log("init")
    this.listenTo(this.model, 'destroy', this.remove)

  events:
    'click .todo-item-done' : 'updateTask'

  render: ->
    @$el.html(@template(title: this.model.get('name'), id: this.model.get('id')))
    this

  updateTask: (e) ->
    fieldId = e.target.getAttribute('id')
    if $("#"+fieldId).is(':checked')
      this.model.save({status: 'complete'})
      @$(".todo-item-display").addClass('complete')
    else
      this.model.save({status: 'new'})
      @$(".todo-item-display").removeClass('complete')
