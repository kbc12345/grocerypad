angular.module('CategoryModal').controller 'CategoryModalCtrl',
['$scope','$rootScope','ProductCategory'
($scope,$rootScope,ProductCategory) ->

  $scope.disableAction = false

  $scope.submit =(form)->
    form.$submitted = true
    if form.$valid
      $scope.disableAction = true
      evalAction()
    else
      $rootScope.growl.error(MESSAGES.FORM_ERROR)

  evalAction = ->
    if !!$scope.category.id
      update()
    else
      create()

  create =(obj)->
    ProductCategory.save(product_category: $scope.category).$promise
      .then (data) ->
        $scope.categories.unshift data
        $rootScope.growl.success(MESSAGES.CREATE_SUCCESS)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  update =->
    ProductCategory.update({id: $scope.category.id, product_category: $scope.category}).$promise
      .then (data) ->
        updateCollection()
        $rootScope.growl.success(MESSAGES.UPDATE_SUCCESS)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  updateCollection = ->
    for obj in $scope.categories
      if obj.id == $scope.category.id
        obj = $scope.category
        break

]
