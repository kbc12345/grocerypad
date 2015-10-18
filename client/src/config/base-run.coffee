angular.module('client').run [
  '$rootScope','$state','growl',($rootScope,$state,growl) ->

    $rootScope.clearSession = ->
      localStorage.removeItem("AuthToken")
      localStorage.removeItem("UserId")
      $rootScope.currentUser = null

    $rootScope.growl = growl

]
