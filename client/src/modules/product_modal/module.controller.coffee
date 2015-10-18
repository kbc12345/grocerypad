angular.module('ProductModal').controller 'ProductModalCtrl',
['$scope','$rootScope'
($scope,$rootScope) ->

  $scope.disableAction = false

  $scope.submit =(form)->
    form.$submitted = true
    if form.$valid
      $scope.disableAction = true
      evalAction()
    else
      $rootScope.growl.error(MESSAGES.FORM_ERROR)

  evalAction = ->
    if $scope.product.id
      update()
    else
      create()

  create =(obj)->
    Product.save(product: $scope.product).$promise
      .then (data) ->
        obj = data
        $scope.products.unshift data
        $rootScope.growl.success(MESSAGES.CREATE_SUCCESS)
      .finally ->
        $scope.disableAction = false

  update =->
    Resource.update({id: $scope.product.id, product: $scope.product}).$promise
      .then (data) ->
        updateCollection()
        $rootScope.growl.success(MESSAGES.UPDATE_SUCCESSp)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  updateCollection = ->
    for obj in $scope.products
      if obj.id == $scope.product.id
        obj = $scope.product
        break

]
