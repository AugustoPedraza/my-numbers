MyNumbersApp.factory('Expenses', [
  '$resource',
  'HOST',
  'API_END_POINT',
  function($resource, HOST, API_END_POINT) {
    var url = HOST + API_END_POINT + '/accounts/:account_id/expenses/:id';
    return $resource(url, { account_id: "@expense.account_id", id: "@expense.id" }, {
        'create':  { method: 'POST' }
      });
}]);
