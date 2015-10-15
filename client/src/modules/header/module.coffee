module = angular.module("Header", [])


module.directive 'header', [
  '$location',
  ($location) ->

    restrict: 'A'
    replace: true
    templateUrl: 'modules/header/template.html'

]
