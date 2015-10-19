angular.module('client').factory 'GroceryItem',
  ['$resource',
  ($resource) ->


    GroceryItem = $resource "/api/grocery_items/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }



    GroceryItem
  ]
