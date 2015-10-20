Ctrl = ($scope,$rootScope,Product,ProductCategory)->


  NProgress.done()

  $scope.uiState =
    productModal: false
    categoryModal: false
    pagination: false


  $scope.temp =
    product: id: null
    category: id: null
    categories: []
    products: []

  ProductCategory.getList().$promise
    .then (data) ->
      $scope.temp.categories = data.collection

  Product.query().$promise
    .then (data) ->
      $scope.temp.products = data

Ctrl.$inject = ['$scope','$rootScope','Product','ProductCategory']
angular.module('client').controller('ProductsCtrl', Ctrl)
