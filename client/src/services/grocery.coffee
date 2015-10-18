angular.module('client').factory 'Grocery',
  ['$resource',
  ($resource) ->


    Grocery = $resource "/api/groceries/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }



    Grocery
  ]
