angular.module('client').factory 'ProductCategory',
  ['$resource',
  ($resource) ->


    ProductCategory = $resource "/api/products/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }

    ProductCategory
  ]
