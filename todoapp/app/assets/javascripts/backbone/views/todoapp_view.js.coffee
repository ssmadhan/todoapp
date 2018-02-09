Todoapp.Views.TodoappView = Backbone.View.extend
  template: JST["backbone/templates/todoapp_main"]


  initialize: ->
    _.bindAll(this, 'fetchTodoItems')
    @todo_collection = new Todoapp.Collections.TaskCollection()
    @limit = 10
    @offset = 0
    this.listenTo(@todo_collection, 'add', this.addOne)

  events:
    'keypress #todo-text-entry' : 'createNewTodo'

  render: ->
    @$el.html(@template())
    @fetchTodoItems()
    @$('#todo-display').bind('scroll', @fetchTodoItems)
    this

  fetchTodoItems: (e=null) ->
    fieldId = null
    fieldId =  e.target.getAttribute('id') if e != null
    if fieldId != null
      if @offset == 0 || $('#'+fieldId).scrollTop() + $('#'+fieldId).innerHeight() >= $('#'+fieldId)[0].scrollHeight
        @todo_collection.fetch({data: {limit: @limit, offset: @offset}})
        @offset = @offset + 10
        console.log("in fetch")

    else
      @todo_collection.fetch({data: {limit: @limit, offset: @offset}})
      @offset = @offset + 10
      console.log("in fetch")



  addOne: (todo) ->
    view = new Todoapp.Views.TodoItemView(model: todo)
    @$("#todo-items-list").append(view.render().el)

  createNewTodo: (e) ->
    if e.which == 13
      todo = @$('#todo-text-entry').val()
      @todo_collection.create({name: todo, status: 'new'})
