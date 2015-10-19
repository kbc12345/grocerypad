Ctrl = ($scope,$rootScope,Grocery,GroceryItem,Product)->

  NProgress.done()

  $scope.uiState =
    modal: false

  $scope.temp =
    grocery_item: id: null

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
    $scope.temp.grocery_item = item
    obj.modal = !obj.modal

  $scope.delete =(obj) ->
    swal DELETE_WARNING, ->
      Product.remove(id: obj.id).$promise
        .then (data) ->
          $.growl.notice {message: MESSAGES.DELETE_SUCCESS}
          $scope.products.splice($scope.products.indexOf(obj),1)

  init()


Ctrl.$inject = ['$scope','$rootScope','Grocery','GroceryItem','Product']
angular.module('client').controller('GroceriesCtrl', Ctrl)
