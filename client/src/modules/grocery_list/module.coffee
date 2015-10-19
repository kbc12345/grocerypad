module = angular.module("GroceryList", [])


module.directive 'groceryList',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/grocery_list/template.html'
