angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'admin.products',
        url: '/products',
        controller: 'ProductsCtrl',
        templateUrl: 'modules/products/index.html'

]
