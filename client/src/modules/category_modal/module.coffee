module = angular.module("CategoryModal", [])

module.directive 'categoryModal',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/category_modal/template.html'
  controller: "CategoryModalCtrl"
  scope:
    categories: "="
    category: "="
    toggle: "="
