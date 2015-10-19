module = angular.module("GrocerySearch", [])


module.directive 'grocerySearch',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/grocery_search/template.html'
