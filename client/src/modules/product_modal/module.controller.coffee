angular.module('ProductModal').controller 'ProductModalCtrl',
['$scope','$rootScope','Product'
($scope,$rootScope,Product) ->

  $scope.disableAction = false

  $scope.submit =(form)->
    form.$submitted = true
    if form.$valid
      $scope.disableAction = true
      evalAction()
    else
      $rootScope.growl.error(MESSAGES.FORM_ERROR)

  evalAction = ->
    if !!$scope.product.id
      update()
    else
      create()

  create =(obj)->
    Product.save(product_category_id: $scope.product.product_category_id, product: $scope.product).$promise
      .then (data) ->
        obj = data.product
        obj.product_category_name = data.product_category
        $scope.products.unshift obj
        $rootScope.growl.success(MESSAGES.CREATE_SUCCESS)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  update =->
    Product.update({id: $scope.product.id, product: $scope.product}).$promise
      .then (data) ->
        updateCollection()
        $rootScope.growl.success(MESSAGES.UPDATE_SUCCESS)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  updateCollection = ->
    for obj in $scope.products
      if obj.id == $scope.product.id
        obj = $scope.product
        break

]
