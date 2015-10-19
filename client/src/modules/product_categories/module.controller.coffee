angular.module('CategoryList').controller 'CategoryListCtrl',
['$scope','$rootScope','ProductCategory'
($scope,$rootScope,ProductCategory) ->

  $scope.toggleModal =(category) ->
    $scope.category = category
    $scope.uiState.categoryModal = !$scope.uiState.categoryModal

  $scope.delete =(obj) ->
    swal DELETE_WARNING, ->
      ProductCategory.remove(id: obj.id).$promise
        .then (data) ->
          $.growl.notice {message: MESSAGES.DELETE_SUCCESS}
          $scope.categories.splice($scope.categories.indexOf(obj),1)
]
