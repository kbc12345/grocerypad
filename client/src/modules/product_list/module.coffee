module = angular.module("ProductList", [])


module.directive 'productList',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/product_list/template.html'
  controller: "ProductListCtrl"
  scope:
    products: "="
    uiState: "="
