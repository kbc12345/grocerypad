Ctrl = ($scope, $state, Session,$rootScope,SearchParams)->
  # change this to collapsed to default collapsed layout

  $scope.layoutClass = ''

  $scope.sample = [
    {
      name: "Lorem Ipsum 1 "
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
    {
      name: "Lorem Ipsum 2"
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
    {
      name: "Lorem Ipsum 3"
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
  ]

  $scope.files = [
    {
      name: "Lorem Ipsum 1 "
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
    {
      name: "Lorem Ipsum 2"
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
    {
      name: "Lorem Ipsum 3"
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
    {
      name: "Lorem Ipsum 4"
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
    {
      name: "Lorem Ipsum 5"
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      date: "12-12-2015"
    }
  ]


  $scope.users = [
    {
      name: "User X"
      position: "Position X"
      expertise: "skill x, skill y"
    }
    {
      name: "User Y"
      position: "Position Y"
      expertise: "skill x, skill y"
    }
    {
      name: "User Z"
      position: "Position Y"
      expertise: "skill x, skill y"
    }
    {
      name: "User A"
      position: "Position Y"
      expertise: "skill x, skill y"
    }
    {
      name: "User B"
      position: "Position Y"
      expertise: "skill x, skill y"
    }
  ]

  $scope.toggleSidebar= ->
    $scope.collapse = !$scope.collapse
    $scope.layoutClass = if $scope.collapse then 'collapsed' else ''

  $scope.search = (query) ->
    $state.go('admin.search', {query: query, option: SearchParams.getCurrentStep()})

  $scope.$watch (() ->
    SearchParams.getQuery()
  ), (newValue, oldValue) ->
    $scope.query = SearchParams.getQuery()

  $scope.logout = () ->
    Session.logout().$promise.then (success) ->
      $rootScope.clearSession()
      $.growl.notice {message: MESSAGES.LOGOUT_SUCCESS}
      $state.go("login")

Ctrl.$inject = ['$scope', '$state', 'Session','$rootScope','SearchParams']
angular.module('client').controller('AdminCtrl', Ctrl)
