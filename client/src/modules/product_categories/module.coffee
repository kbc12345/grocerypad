module = angular.module("CategoryList", [])


module.directive 'categoryList',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/product_categories/template.html'
  controller: "CategoryListCtrl"
  scope:
    categories: "="
    uiState: "="
    category: "="
