Todoapp.Routers.TodoAppRouter = Backbone.Router.extend

  routes:
    "home": "displayMainAppContent"

  initialize: ->

  displayMainAppContent: ->
    view = new Todoapp.Views.TodoappView()
    $('#todoapp-main-container').html(view.render().el)