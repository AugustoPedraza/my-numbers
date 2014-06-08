MyNumbersApp.controller('NewExpenseController',
  [
    '$scope',
    '$modalInstance',
    'Budget',
    'CashFlow',
    'accountId',
function($scope, $modalInstance, Budget, CashFlow, accountId) {
  console.log(accountId);
  $scope.cashFlow = { account_id : accountId};
  $scope.submitted = false;

  $scope.data = {};
  $scope.data.errors = [];
  $scope.data.budgets = Budget.query();

  $scope.addNewExpense = function(newExpenseForm) {
    $scope.submitted = true;

    if(newExpenseForm.$valid) {
      //Invoke the server. If all is ok, close the modal. If some error was found, shows the errors.

      $scope.cashFlow.account_id = 2;

      CashFlow.create({cash_flow : $scope.cashFlow }, function(objSuccess) {
        $modalInstance.close();
      }, function(objError) {
        console.log(':(');
        console.debug(objError);
      });

    }
  };

  $scope.closeForm = function() {
    $modalInstance.dismiss();
  };

}]);
