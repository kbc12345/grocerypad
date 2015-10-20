angular.module('ProductList').controller 'ProductListCtrl',
['$scope','$rootScope','Product'
($scope,$rootScope,Product) ->

  $scope.toggleModal =(product) ->
    if !!product
      $scope.product = product
    else
      $scope.product = new Product({status: PRODUCT_STATUS[0].value, product_category_id: $scope.categories[0].id})

    $scope.uiState.productModal = !$scope.uiState.productModal

  $scope.delete =(obj) ->
    swal DELETE_WARNING, ->
      Product.remove(id: obj.id).$promise
        .then (data) ->
          $rootScope.growl.error(MESSAGES.DELETE_SUCCESS)
          $scope.products.splice($scope.products.indexOf(obj),1)

]
