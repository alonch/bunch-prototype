var app = angular.module('turnoverSuncor',[]);

app.config(function($interpolateProvider){
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');
});

var regexIso8601 = /^(\d{4}|\+\d{6})(?:-(\d{2})(?:-(\d{2})(?:T(\d{2}):(\d{2}):(\d{2})\.(\d{1,})(Z|([\-+])(\d{2}):(\d{2}))?)?)?)?$/;
function convertDateStringsToDates(input) {
    // Ignore things that aren't objects.
    if (typeof input !== "object") return input;

    for (var key in input) {
        if (!input.hasOwnProperty(key)) continue;

        var value = input[key];
        var match;
        // Check for string properties which look like dates.
        if (typeof value === "string" && (match = value.match(regexIso8601))) {
            var milliseconds = Date.parse(match[0])
            if (!isNaN(milliseconds)) {
                input[key] = new Date(milliseconds);
            }
        } else if (typeof value === "object") {
            // Recurse into object
            convertDateStringsToDates(value);
        }
    }
}

app.config(["$httpProvider", function ($httpProvider) {
  $httpProvider.defaults.transformResponse.push(function(responseData){
    convertDateStringsToDates(responseData);
    return responseData;
  });
  $httpProvider.defaults.transformRequest.unshift(function(requestData){
    if (typeof requestData === "undefined"){
      return requestData;
    }
    if (typeof requestData.getPrivateFields !== "function") { 
      return requestData;
    }
    var fields = requestData.getPrivateFields();
    for (var i in fields){
      delete requestData[fields[i]];  
    }
    return requestData; 
  });
}]);


app.factory('Punch', ['$http', function($http) {
  function Punch(data) {
      if (data) {
          this.setData(data);
      }
      // Some other initializations related to Bunch
    };
    Punch.prototype = {
      getPrivateFields: function(){
        return ['statusText'];
      },
      setData: function(data) {
          angular.extend(this, data);
      },
      save: function() {
        var scope = this;
        var promise = $http.put('/rest/punch', scope).
          success(function(data, status, headers, config) {
            scope.id = data.id;
            scope.saved = true;
          }).
          error(function(data, status, headers, config) {
            scope.id = -1;
            scope.saved = false;
          });
        return promise;
      },
      statusText: function(text){
        if (typeof(text) === "undefined"){
          return this.status == true? "Open" : "Closed";
        }
        console.log(text);
        this.status = text==="Open";
      }
      // Some other methods related to Bunch
    };
    return Punch
}]);

app.factory('bunchManager', ['$http', function($http) {
  var bunchManager = {
    recentPunches: [],
    getRecentPunches: function(){
      return this.recentPunches
    },
    addRecentPunch: function(punch){
      this.recentPunches.push(punch);
    }
  };
  return bunchManager;
}]);

app.directive('punchForm', function() {
  return {
    restrict: 'A',
    templateUrl: '/static/html/punch-form.tpl'
  }
});

app.directive('punchDetails', function() {
  return {
    restrict: 'A',
    templateUrl: '/static/html/punch-details.tpl'
  }
});


app.controller('punchController', ['$scope','Punch','bunchManager', function($scope, Punch, bunchManager) {
  $scope.punch = new Punch();
  $scope.save = function(){
    bunchManager.addRecentPunch($scope.punch);
    $scope.punch.save();
    $scope.punch = new Punch();
    $scope.statusText = "";
  };
  $scope.getRecentPunches = function(){
    return bunchManager.getRecentPunches();
  };
  $scope.hasRecents = function(){
    return bunchManager.getRecentPunches().length > 0
  }
}]);

app.controller('punchUpdateController', ['$scope', function($scope){

}]);
