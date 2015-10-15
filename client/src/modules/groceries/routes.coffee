angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'admin.groceries',
        url: '/groceries',
        controller: 'GroceriesCtrl',
        templateUrl: 'modules/groceries/index.html'

]
