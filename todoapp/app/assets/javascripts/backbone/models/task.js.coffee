Todoapp.Models.TaskModel = Backbone.Model.extend
  defaults: ->
    return {name: 'empty title', status: 'new'}

Todoapp.Collections.TaskCollection = Backbone.Collection.extend
  url: '/tasks'
  model: Todoapp.Models.TaskModel

