angular.module('client').config [
  "growlProvider"
  (growlProvider) ->
    growlProvider.globalTimeToLive 1500
    growlProvider.globalPosition "top-right"
    growlProvider.globalDisableIcons(true)
    growlProvider.globalDisableCountDown(true)
    growlProvider.onlyUniqueMessages(true)
]
