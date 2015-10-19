angular.module('ProductList').controller 'ProductListCtrl',
['$scope','$rootScope','Product'
($scope,$rootScope,Product) ->

  $scope.toggleModal =(product) ->
    $scope.product = product
    $scope.uiState.productModal = !$scope.uiState.productModal

  $scope.delete =(obj) ->
    swal DELETE_WARNING, ->
      Product.remove(id: obj.id).$promise
        .then (data) ->
          $rootScope.growl.error(MESSAGES.DELETE_SUCCESS)
          $scope.products.splice($scope.products.indexOf(obj),1)

]
