module = angular.module("Sidebar", [])


module.directive 'sidebar', [
  '$location', 'Setting',
  ($location, Setting) ->

    restrict: 'A'
    replace: true
    templateUrl: 'modules/sidebar/template.html'

    link: ($scope, $element, $attrs) ->
      $scope.location = $location
      $scope.settingsProperties = Setting.properties

      $scope.toggleMenu =(section) ->
        $scope.activeRootUrl =
          if $scope.activeRootUrl == section
            $scope.activeRootUrl = ''
          else
            $scope.activeRootUrl = section
]
