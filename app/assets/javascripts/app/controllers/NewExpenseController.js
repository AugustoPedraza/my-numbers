MyNumbersApp.controller('NewExpenseController',
  [
    '$scope',
    '$modalInstance',
    'Budget',
function($scope, $modalInstance, Budget) {
  $scope.data = {};
  $scope.data.errors = [];


  $scope.submitted = false;

  //Fakes budgets
  $scope.data.budgets = Budget.query();

  $scope.addNewExpense = function(newExpenseForm) {
    $scope.submitted = true;

    if(newExpenseForm.$valid) {
      //Invoke the server. If all is ok, close the modal. If some error was found, shows the errors.

      // $scope.data.errors.push("Example some generic error");

      $modalInstance.close();
    }
  };

  $scope.closeForm = function() {
    $modalInstance.dismiss();
  };

}]);
