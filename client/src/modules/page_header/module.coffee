module = angular.module("PageHeader", [])


module.directive 'pageHeader', [
  '$location',
  ($location) ->

    restrict: 'E'
    replace: true
    templateUrl: 'modules/page_header/template.html'
    scope:
      title: "@"

]
