angular.module('client').run [
  '$rootScope','$state',($rootScope,$state) ->
  '$rootScope','$state','growl',($rootScope,$state,growl) ->

    $rootScope.clearSession = ->
      localStorage.removeItem("AuthToken")
      localStorage.removeItem("UserId")
      $rootScope.currentUser = null

    $rootScope.growl = growl

]
