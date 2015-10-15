module = angular.module("Sidebar", [])


module.directive 'sidebar', [
  '$location',
  ($location) ->
    restrict: 'A'
    replace: true
    templateUrl: 'modules/sidebar/template.html'

]
