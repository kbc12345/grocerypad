module = angular.module("Reminders", [])


module.directive 'reminders',->
  restrict: 'E'
  replace: true
  templateUrl: 'modules/reminders/template.html'
  scope:
    collection: "="
