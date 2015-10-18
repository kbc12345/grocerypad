Ctrl = ($scope,$rootScope)->


  NProgress.done()

  $scope.products = [
    {
      name: "Prodyct X"
      price: 100
      product_category: "Category X"
      status: "Depleted"
      id: 1
    }
    {
      name: "Prodyct Y"
      price: 100
      product_category: "Category X"
      status: "Depleted"
      id: 1
    }
    {
      name: "Prodyct Z"
      price: 100
      product_category: "Category X"
      status: "Depleted"
      id: 1
    }
  ]


  $scope.categories = [
    {
      name: "Category X"
      id: 1
    }
    {
      name: "Category Y"
      id: 1
    }
  ]

Ctrl.$inject = ['$scope','$rootScope']
angular.module('client').controller('ProductsCtrl', Ctrl)
