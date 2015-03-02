var app = angular.module('turnoverSuncor',[]);
app.run(function($rootScope) {
    $rootScope.recentPunches = [];
})

app.config(function($interpolateProvider){
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');
});

app.factory('Punch', ['$http', function($http) {
  function Punch(data) {
      if (data) {
          this.setData(data);
      }
      // Some other initializations related to Bunch
    };
    Punch.prototype = {
        setData: function(data) {
            angular.extend(scope, data);
        },
        getStatusText: function(){
          return scope.status === true? "Open" : "Closed"
        },
        save: function() {
          var scope = this;
          var promise = $http.put('/rest/punch', scope).
            success(function(data, status, headers, config) {
              scope.id = data.id;
              scope.saved = true;
              console.log(scope);
            }).
            error(function(data, status, headers, config) {
              console.log(scope);
              scope.id = -1;
              scope.saved = false;
            });
          return promise;
        }
        // Some other methods related to Bunch
    };
    return Punch
}]);

app.factory('bunchManager', ['$http', function($http) {
  var bunchManager = {
    
  };
  return bunchManager;
}]);

app.controller('punchController', ['$scope','Punch', function($scope, Punch) {
  $scope.punch = new Punch();
  $scope.updateStatus = function(){
    $scope.punch.status = $scope.statusText === "Open";
  };
  $scope.save = function(){
    $scope.recentPunches.push($scope.punch);
    $scope.punch.save();
    $scope.punch = new Punch();
  }
}]);


