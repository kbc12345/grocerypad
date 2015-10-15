module = angular.module("Logs", [])


module.directive 'logBtn', ->
  restrict: 'A'
  replace: true
  controller: "LogCtrl"
  templateUrl: 'modules/logs/button.html'
  scope:
    parentType: "@"
    parentId: "="
    label: "@"
    displayType: "@"
  link: ($scope, element) ->
    $scope.displayType = 'button' unless !!$scope.displayType

module.directive 'logModal', ->
  restrict: 'A'
  replace: true
  controller: "LogCtrl"
  templateUrl: 'modules/logs/modal.html'
