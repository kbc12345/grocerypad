Ctrl = ($scope,$rootScope,Grocery,GroceryItem,Product)->

  NProgress.done()

  $scope.uiState =
    modal: false

  $scope.temp =
    grocery_item: null

  $scope.months = MONTHS
  $scope.divisions = DIVISIONS
  $scope.query =
  	year: moment().format("YYYY")
  	month:  $scope.months[parseInt(moment().format("M"))-1]
  $scope.query.divisions = if moment().format("DD") > 15 then DIVISIONS[1] else DIVISIONS[0]

  init = ->
    Product.query().$promise
      .then (data) ->
        $scope.products = data

    $scope.getCollection()

  $scope.getCollection = ->
    Grocery.getList(query: $scope.query).$promise
      .then (data) ->
        $scope.grocery = data

  $scope.toggleModal =(obj,item) ->
    $scope.temp.grocery_item = angular.copy item
    obj.modal = !obj.modal

  $scope.delete =(obj,index) ->
    swal DELETE_WARNING, ->
      GroceryItem.remove({id: obj.id,grocery_id: $scope.grocery.id}).$promise
        .then (data) ->
          $rootScope.growl.error(MESSAGES.DELETE_SUCCESS)
          $scope.grocery.items[index].grocery_items.splice($scope.grocery.items[index].grocery_items.indexOf(obj),1)
          $scope.grocery.items[index].total_price -= obj.quantity*obj.price

  init()


Ctrl.$inject = ['$scope','$rootScope','Grocery','GroceryItem','Product']
angular.module('client').controller('GroceriesCtrl', Ctrl)
