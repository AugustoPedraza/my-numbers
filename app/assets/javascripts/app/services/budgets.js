MyNumbersApp.factory('Budget', ['$resource', 'HOST', 'API_END_POINT', function($resource, HOST, API_END_POINT) {
  return $resource(HOST + API_END_POINT + '/budgets/:id', {}, {
        query:  { method: 'GET', isArray: true }
      });
}]);
