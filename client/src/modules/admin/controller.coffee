Ctrl = ($scope, $state,$rootScope)->

  $scope.logout = () ->
    Session.logout().$promise.then (success) ->
      $rootScope.clearSession()
      $.growl.notice {message: MESSAGES.LOGOUT_SUCCESS}
      $state.go("login")

Ctrl.$inject = ['$scope', '$state','$rootScope']
angular.module('client').controller('AdminCtrl', Ctrl)
