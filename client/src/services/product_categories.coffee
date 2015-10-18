angular.module('client').factory 'ProductCategory',
  ['$resource',
  ($resource) ->


    ProductCategory = $resource "/api/product_categories/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }

    ProductCategory
  ]
