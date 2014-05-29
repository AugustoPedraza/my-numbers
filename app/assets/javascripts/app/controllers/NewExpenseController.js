MyNumbersApp.controller('NewExpenseController',
  [
    '$scope',
    '$modalInstance',
function($scope, $modalInstance) {
  $scope.data = {};
  $scope.data.errors = [];


  $scope.submitted = false;

  //Fakes budgets
  $scope.data.budgets = [
    { name: 'Libre bambi', id: 10 },
    { name: 'Libre corzu', id: 30 },
    { name: 'Comestibles', id: 153 },
    { name: 'Transporte',  id: 33 }
  ];

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
