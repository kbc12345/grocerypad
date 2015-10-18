angular.module('client').factory 'Reminder',
  ['$resource',
  ($resource) ->


    Reminder = $resource "/api/reminders/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }



    Reminder
  ]
