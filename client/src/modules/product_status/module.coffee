module = angular.module("ProductStatus", [])

module.directive 'productStatus', ->
  restrict: 'A'
  replace: true
  templateUrl: 'modules/product_status/template.html'
  scope:
    status: "="
    complete: "="

  link: ($scope, element) ->
    $scope.obj =
      status: PRODUCT_STATUS[0].value
    if $scope.complete
      $scope.obj =
        status: ''
      all =
        label: "All"
        value: ''
      $scope.statusCollection = PRODUCT_STATUS.unshift(all)
    else
      $scope.statusCollection = PRODUCT_STATUS


    $scope.updateStatus =(selectedObj)->
      $scope.status = $scope.obj.status
