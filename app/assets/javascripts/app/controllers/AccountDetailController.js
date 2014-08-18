MyNumbersApp.controller('AccountDetailController',
  [
    '$scope',
    '$routeParams',
    '$route',
    '$modal',
    'Account',
function($scope, $routeParams, $route, $modal, Account) {
  $scope.data = {};

  Account.get({id:$routeParams.id}, function(data){
    $scope.data.account = data;
  }, function(error){
    alert('Account not found');
    $location.url('/');
  });

  $scope.openModalForNewExpense = function() {
    $modal.open({
      templateUrl: 'assets/app/views/new-expense-modal.html',
      size: 'lg',
      controller: 'NewExpenseController',
      resolve: {
        accountId : function() {
          return $scope.data.account.id;
        }
      }
    }).result.then(function() {
      $route.reload();
    });
  };

}]);
