module = angular.module("PageHeader", [])


module.directive 'peageHeader', [
  '$location',
  ($location) ->

    restrict: 'A'
    replace: true
    templateUrl: 'modules/page_header/template.html'
    scope:
      title: "@"

]
