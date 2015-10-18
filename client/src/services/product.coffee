angular.module('client').factory 'Product',
  ['$resource',
  ($resource) ->


    Product = $resource "/api/products/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
        getList:
          method: 'GET'
      }



    Product
  ]
