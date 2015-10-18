angular.module('client')
  .config [
    '$authProvider',
    ($authProvider) ->

      $authProvider.google clientId: '728625496758-36p42e4dh1vfii76r6ni1i0rd14n5io9.apps.googleusercontent.com'

      # debugger;
      $authProvider.google({
        url: '/api/session',
        authorizationEndpoint: 'https://accounts.google.com/o/oauth2/auth',
        redirectUri: window.location.origin || window.location.protocol + '//' + window.location.host,
        requiredUrlParams: ['scope'],
        optionalUrlParams: ['display'],
        scope: ['profile', 'email'],
        scopePrefix: 'openid',
        scopeDelimiter: ' ',
        display: 'popup',
        type: '2.0',
        popupOptions: { width: 452, height: 633 }
      });
  ]
