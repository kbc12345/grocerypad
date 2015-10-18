angular.module('CategoryList').controller 'CategoryListCtrl',
['$scope','$rootScope'
($scope,$rootScope) ->

  $scope.toggleModal =(category) ->
    $scope.category = category
    $scope.uiState.categoryModal = !$scope.uiState.categoryModal
]
