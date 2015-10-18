angular.module('client').factory 'GroceryItem',
  ['$resource',
  ($resource) ->


    GroceryItem = $resource "/api/groceries/:grocery_id/grocery_items/:id", {id: "@id", grocery_id: "@grocery_id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }



    GroceryItem
  ]
