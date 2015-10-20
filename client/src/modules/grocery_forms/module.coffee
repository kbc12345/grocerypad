module = angular.module("GroceryForms", [])

module.directive 'itemModal',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/grocery_forms/modal.html'
  controller: "ItemModalCtrl"
  scope:
    collection: "="
    groceryItem: "="
    toggle: "="
    products: "="
    category: "="
    groceryId: "="
