MyNumbersApp.factory('CashFlow', [
  '$resource',
  'HOST',
  'API_END_POINT',
  function($resource, HOST, API_END_POINT) {
    var url = HOST + API_END_POINT + '/accounts/:account_id/cash_flows/:id';
    return $resource(url, { account_id: "@cash_flow.account_id", id: "@cash_flow.id" }, {
        'create':  { method: 'POST' }
      });
}]);
