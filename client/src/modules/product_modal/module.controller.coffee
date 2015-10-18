angular.module('ProductModal').controller 'ProductModalCtrl',
['$scope','$rootScope'
($scope,$rootScope) ->

  $scope.disableAction = false

  $scope.submit =(form)->
    $scope.disableAction = true
    form.$submitted = true
    if form.$valid
      evalAction()
    else
      $.growl.error {message: MESSAGES.FORM_ERROR}

  evalAction = ->
    if $scope.obj.id
      update($scope.obj,$scope.currentIndex)
    else
      create($scope.obj)

  create =(obj)->
    Product.save(product: obj).$promise
      .then (data) ->
        obj = data
        $scope.products.unshift data
        $.growl.notice {message: MESSAGES.CREATE_SUCCESS}
      .finally ->
        $scope.disableAction = false

  update =(obj,index)->
    Resource.update({id: obj.id, resource_type: $scope.resourceType}, resource: obj, update_linking_record: $scope.updateLinkingRecord).$promise
      .then (data) ->
        $scope.products[index] = obj
        $.growl.notice {message: MESSAGES.UPDATE_SUCCESS}
        $scope.toggle = false
      .finally ->
        $scope.disableAction = false

]
