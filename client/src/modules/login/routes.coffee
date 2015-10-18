angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'login',
        url: '/login',
        controller: 'LoginCtrl',
        templateUrl: 'modules/login/index.html'
        data:
          unauthenticated: true

]
