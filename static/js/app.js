var app = angular.module('turnoverSuncor',[]);
app.run(function($rootScope) {
    $rootScope.recentPunches = [];
})

app.config(function($interpolateProvider){
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');
});

app.controller('punchController', ['$scope', function($scope) {
  $scope.punch = {};
  $scope.save = function(){
    $scope.recentPunches.push($scope.punch);
    console.log($scope.punch)
    $scope.punch = {};
  }
}]);

