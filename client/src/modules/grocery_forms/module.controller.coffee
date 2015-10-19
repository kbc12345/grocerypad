angular.module('GroceryForms').controller 'ItemModalCtrl',
['$scope','$rootScope','GroceryItem'
($scope,$rootScope,GroceryItem) ->

  $scope.disableAction = false
  $scope.temp =
    product: null

  $scope.currentProducts = []
  for obj in $scope.products
    $scope.currentProducts.push(obj) if obj.product_category_id ==  $scope.category

  $scope.submit =(form)->
    form.$submitted = true
    if form.$valid
      $scope.disableAction = true
      evalAction()
    else
      $rootScope.growl.error(MESSAGES.FORM_ERROR)

  evalAction = ->
    if !!$scope.grocery_item.id
      update()
    else
      create()

  create =->
    obj =
      product_id: $scope.temp.product.id
      product_name: $scope.temp.product.name
      price: $scope.temp.product.price
      total: $scope.temp.product.price*$scope.grocery_item.quantity
      quantity: $scope.grocery_item.quantity
      product_status: $scope.temp.product.status

    GroceryItem.save(grocery_id: $scope.groceryId, grocery_item: obj).$promise
      .then (data) ->
        obj.id = data.id
        $scope.collection.unshift obj
        $rootScope.growl.success(MESSAGES.CREATE_SUCCESS)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  update =->
    GroceryItem.update({grocery_id: $scope.groceryId,id: $scope.grocery_item.id, grocery_item: $scope.grocery_item}).$promise
      .then (data) ->
        updateCollection()
        $rootScope.growl.success(MESSAGES.UPDATE_SUCCESS)
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

  updateCollection = ->
    for obj in $scope.collection
      if obj.id == $scope.grocery_item.id
        obj = $scope.grocery_item
        break

]
