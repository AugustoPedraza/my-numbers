MyNumbersApp.factory('Account', ['$resource', 'HOST', 'API_END_POINT', function($resource, HOST, API_END_POINT) {
  return $resource(HOST + API_END_POINT + '/accounts/:accountId');
}]);
