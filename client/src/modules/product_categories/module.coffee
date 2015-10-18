module = angular.module("ProductCategories", [])


module.directive 'productCategories', [
  '$location',
  ($location) ->

    restrict: 'E'
    replace: true
    templateUrl: 'modules/product_categories/template.html'
    controller: "ProductCategoriesCtrl"
    scope:
      categories: "="

]
