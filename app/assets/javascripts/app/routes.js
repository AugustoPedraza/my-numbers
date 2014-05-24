MyNumbersApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/accounts', {
        templateUrl: 'assets/app/views/accounts-list.html',
        controller: 'AccountListController'
      }).
      when('/', {
        templateUrl: 'assets/app/views/dashboard.html'
        // controller: 'AccountListController'
      }).
      when('/accounts/:id', {
        templateUrl: 'assets/app/views/account-detail.html',
        controller: 'AccountDetailController'
      })
  }]);
