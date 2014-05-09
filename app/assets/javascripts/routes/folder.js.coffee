Mailr.FolderRoute = Ember.Route.extend(
  model: (params) ->
      return { id: 1, indent: 'folder1', name: 'Folder 1'}
)
# Mailr.FolderIndexRoute = Ember.Route.extend(
#   model: (params) ->
#     return { name: 'Mój Folder 2' }
# )
Mailr.FolderMessagesRoute = Ember.Route.extend(

  model: (params) ->
    return [
      { id: 1, title: 'Wiadomość 1'},
      { id: 2, title: 'Wiadomość 2'},
      { id: 3, title: 'Wiadomość 3'},
      { id: 4, title: 'Wiadomość 4'},
      { id: 5, title: 'Wiadomość 5'}]

  folders: [
    { id: 1, indent: 'folder1', name: 'Folder 1'},
    { id: 2, indent: 'folder2', name: 'Folder 2'},
    { id: 3, indent: 'folder3', name: 'Folder 3'},
    { id: 4, indent: 'folder4', name: 'Folder 4'},
    { id: 5, indent: 'folder5', name: 'Folder 5'}
  ]

  # setupController: (controller, model) ->
  #   @controllerFor('folders').set('model', ['21321','12321','12123'])
  #   @controllerFor('folders').set('currentFolder', @controllerFor('application').get('currentFolder'))
  #   @controllerFor('folder.messages').set('model', model)

  renderTemplate: () ->
    @render('folder/messages',
      # controller: 'folders'
      outlet: 'sidebar'
      into: 'application'
    )
    @render('folder/messages')
)


