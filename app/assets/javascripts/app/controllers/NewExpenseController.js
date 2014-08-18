MyNumbersApp.controller('NewExpenseController',
  [
    '$scope',
    '$modalInstance',
    'Budget',
    'Expenses',
    'accountId',
function($scope, $modalInstance, Budget, Expenses, accountId) {
  $scope.expense = { account_id : accountId};
  $scope.submitted = false;

  $scope.data = {};
  $scope.data.errors = [];
  $scope.data.budgets = Budget.query();

  $scope.addNewExpense = function(newExpenseForm) {
    $scope.submitted = true;

    if(newExpenseForm.$valid) {
      //Invoke the server. If all is ok, close the modal. If some error was found, shows the errors.

      Expenses.create({expense : $scope.expense }, function(objSuccess) {
        $modalInstance.close();
      }, function(objError) {
        console.log(':(');
        console.debug(objError);
        $scope.data.errors = objError.data;
      });

    }
  };

  $scope.closeForm = function() {
    $modalInstance.dismiss();
  };

}]);
