Ctrl = ($scope,$state,Session)->

  NProgress.done()

  $scope.login =(form)->
    form.$submitted = true
    Session.login(credentials: $scope.credentials, timezone: moment().format("Z")).$promise
      .then (data) ->
        localStorage.setItem("AuthToken", data.auth_token)
        localStorage.setItem("UserId", data.user_id)
        localStorage.setItem("SearchApiLink", data.search_api_link)
        $.growl.notice {message: MESSAGES.LOGIN_SUCCESS}
        $state.go(ROOT_PATH)




Ctrl.$inject = ['$scope','$state','Session']
angular.module('client').controller('LoginCtrl', Ctrl)
