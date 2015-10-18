angular.module('ProductList').controller 'ProductListCtrl',
['$scope','$rootScope'
($scope,$rootScope) ->

  $scope.uiState =
    modal: false
    pagination: false

  $scope.toggleModal =(product) ->
    $scope.product = product
    $scope.uiState.modal = !$scope.uiState.modal
]
