module = angular.module("ProductModal", [])

module.directive 'productModal',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/product_modal/template.html'
  controller: "ProductModalCtrl"
  scope:
    products: "="
    product: "="
    toggle: "="
    categories: "="
