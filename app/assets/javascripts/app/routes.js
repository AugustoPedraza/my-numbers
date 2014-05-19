MyNumbersApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/accounts', {
        templateUrl: 'assets/app/views/accounts-list.html',
        controller: 'AccountListController'
      }).
      otherwise({
        redirectTo: '/accounts'
      });
  }]);