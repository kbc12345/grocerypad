Ctrl = ($rootScope, $scope,$state,$auth,Session)->

  NProgress.done()

  $scope.authenticate = (provider) ->
    $auth.authenticate(provider)
      .then (obj) ->
        localStorage.setItem("AuthToken", obj.data.user.auth_token)
        localStorage.setItem("UserId",  obj.data.user.id)
        $rootScope.growl.success(MESSAGES.LOGIN_SUCCESS)
        $state.go("admin.groceries")

Ctrl.$inject = ['$rootScope', '$scope','$state','$auth','Session']
angular.module('client').controller('LoginCtrl', Ctrl)
