module = angular.module("ProductList", [])


module.directive 'productList', [
  '$location',
  ($location) ->

    restrict: 'E'
    replace: true
    templateUrl: 'modules/product_list/template.html'
    controller: "ProductsCtrl"
    scope:
      products: "="

]
