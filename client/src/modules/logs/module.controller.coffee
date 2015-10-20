angular.module('Logs').controller 'LogCtrl',
['$scope','$http','$rootScope'
($scope,$http,$rootScope) ->


  $rootScope.page = 1
  $rootScope.logs = []
  $rootScope.logUi =
    modal: false
    action: true

  $scope.toggleLogModal =(parentType,parentId,label)->
    $rootScope.logUi.modal = !$rootScope.logUi.modal
    $rootScope.$broadcast('log-modal-behavior', { close: $rootScope.logUi.modal})
    $rootScope.logUi.action = true
    $rootScope.parentType = parentType
    $rootScope.label = label
    $rootScope.parentId = parentId
    $rootScope.logs = []
    # toggleBodyScroll()
    $scope.getLogs() if $rootScope.logUi.modal

  $scope.details = (obj) ->
    "#{obj.content} on #{obj.created_at.formatTimestamp()}"

  $scope.getLabel = ->
    "Logs for #{$rootScope.logUi.label}"

  $scope.loadMore = ->
    $rootScope.logPage +=1
    processLogs()

  $scope.getLogs = ->
    $rootScope.logPage = 1
    processLogs()

  processLogs = ->
    $http.get("/api/logs?parent_type=#{$rootScope.parentType}&parent_id=#{$rootScope.parentId}")
      .then (data) ->
        $rootScope.logs = $rootScope.logs.concat data.data
        $.growl.error {message: MESSAGES.NO_DATA} if data.data.length == 0
        $rootScope.logUi.action = true


]
