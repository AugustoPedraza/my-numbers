MyNumbersApp.controller('AccountDetailController',
  [
    '$scope',
    '$routeParams',
    '$location',
    'Account',
function($scope, $routeParams, $location, Account) {
  $scope.data = {};

  Account.get({id:$routeParams.id}, function(data){
    $scope.data.account = data;
  }, function(error){
    alert('Account not found');
    $location.url('/');
  });

}]);
