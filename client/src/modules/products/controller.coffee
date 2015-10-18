Ctrl = ($scope,$rootScope)->
Ctrl = ($scope,$rootScope,Product,ProductCategory)->


  NProgress.done()

  $scope.uiState =
    productModal: false
    categoryModal: false
    pagination: false
    productLoad: false
    categoryLoad: false

  $scope.temp =
    product: id: null
    category: id: null
    categories: []
    products: []

  ProductCategory.getList().$promise
    .then (data) ->
      $scope.temp.categories = data.collection
    .finally ->
      $scope.uiState.categoryLoad = true

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
Ctrl.$inject = ['$scope','$rootScope','Product','ProductCategory']
angular.module('client').controller('ProductsCtrl', Ctrl)
