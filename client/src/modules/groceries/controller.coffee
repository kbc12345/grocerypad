Ctrl = ($scope,$rootScope,Grocery,GroceryItem,Product)->

  NProgress.done()

  $scope.months = MONTHS
  $scope.divisions = DIVISIONS
  $scope.query =
  	year: moment().format("YYYY")
  	month:  $scope.months[parseInt(moment().format("M"))-1]
  $scope.query.divisions = if moment().format("DD") > 15 then DIVISIONS[1] else DIVISIONS[0]


  $scope.getCollection = ->
    Grocery.getList(query: $scope.query).$promise
      .then (data) ->
        $scope.collection = data

  $scope.getCollection()
  # $scope.collection = [
  #   {
  #     product_category: "fruits",
  #     product_category_id: 2,
  #     total_price: 1222,
  #     grocery_items: [
  #       {
  #         id:  1,
  #         product_name: "Oranges",
  #         quantity: 1,
  #         price: 100,
  #         total: 1,
  #         product_status: "Depleted",
  #         prodict_id: 2
  #       },
  #       {
  #         id:  1,
  #         product_name: "e",
  #         quantity: 1,
  #         price: 1,
  #         total: 1,
  #         product_status: "Depleted",
  #         prodict_id: 2
  #       }
  #     ]
  #   },
  #   {
  #     product_category: "Y",
  #     total_price: 1222,
  #     grocery_items: [
  #       {
  #         id:  1,
  #         product_name: "e",
  #         quantity: 1,
  #         price: 1,
  #         total: 1,
  #         status: "Depleted"
  #       },
  #       {
  #         id:  1,
  #         product_name: "e",
  #         quantity: 1,
  #         price: 1,
  #         total: 1,
  #         status: "Depleted"
  #       }
  #     ]
  #   }
  # ]


Ctrl.$inject = ['$scope','$rootScope','Grocery','GroceryItem','Product']
angular.module('client').controller('GroceriesCtrl', Ctrl)
