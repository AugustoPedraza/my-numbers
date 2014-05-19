MyNumbersApp.controller('AccountListController', ['$scope', 'Account', function($scope, Account){
  $scope.data = {};
  $scope.data.accounts = Account.query();

}]);
