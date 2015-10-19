angular.module('GroceryForms').controller 'ItemModalCtrl',
['$scope','$rootScope','GroceryItem'
($scope,$rootScope,GroceryItem) ->

  $scope.disableAction = false
  $scope.temp =
    product: id: null

  $scope.currentProducts = []
  for obj in $scope.products
    $scope.currentProducts.push(obj) if obj.product_category_id ==  $scope.category.product_category_id

  $scope.temp.product.price = $scope.groceryItem.price if !!$scope.groceryItem

  $scope.submit =(form)->
    form.$submitted = true
    if form.$valid
      $scope.disableAction = true
      evalAction()
    else
      $rootScope.growl.error(MESSAGES.FORM_ERROR)

  evalAction = ->
    if !!$scope.groceryItem.id
      update()
    else
      create()

  create =->
    obj =
      product_id: $scope.temp.product.id
      product_name: $scope.temp.product.name
      price: $scope.temp.product.price
      total: $scope.temp.product.price*$scope.groceryItem.quantity
      quantity: $scope.groceryItem.quantity
      product_status: $scope.temp.product.status

    GroceryItem.save(grocery_id: $scope.groceryId, grocery_item: obj).$promise
      .then (data) ->
        obj.id = data.id
        $scope.category.grocery_items.unshift obj
        $scope.category.total_price += obj.price*obj.quantity
        $rootScope.growl.success(MESSAGES.CREATE_SUCCESS)
        $scope.category.modal = false
      .finally ->
        $scope.disableAction = false

  update =->
    obj =
      quantity: $scope.groceryItem.quantity
    GroceryItem.update({grocery_id: $scope.groceryId,id: $scope.groceryItem.id, grocery_item: obj}).$promise
      .then (data) ->
        updateCollection()
        $rootScope.growl.success(MESSAGES.UPDATE_SUCCESS)
        $scope.category.modal = false
      .finally ->
        $scope.disableAction = false

  updateCollection = ->
    total = 0
    for obj in $scope.category.grocery_items
      obj.quantity  = $scope.groceryItem.quantity if obj.id == $scope.groceryItem.id
      total += obj.quantity*obj.price
    $scope.category.total_price = total

]
