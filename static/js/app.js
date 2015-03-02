var app = angular.module('turnoverSuncor',['ui.bootstrap']);

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
}]);

app.factory('PunchFilter', ['$http', function($http) {
  function PunchFilter(){
    this.categories = {
      a: true,
      bsu: true,
      bcc: true,
      bcsu: true,
      cbcc: true
    };
    this.statuses = {
      open: true,
      closed: true
    };
  }
  PunchFilter.prototype = {

  };
  return PunchFilter;
}]);

app.factory('Punch', ['$http', function($http) {
  function Punch() {
      // Some initializations related to Bunch
  };
  Punch.prototype = {
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
        if (typeof(this.status) === "undefined"){
          return "";
        }
        return this.status == true? "Open" : "Closed";
      }
      this.status = text==="Open";
    }
    // Some other methods related to Bunch
  };
  return Punch
}]);

app.factory('bunchManager', ['$http', function($http) {
  var bunchManager = {
    punches: [],
    getPunches: function(){
      return this.punches
    },
    addPunch: function(punch){
      this.punches.push(punch);
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

app.directive('punchFilterForm', function() {
  return {
    restrict: 'A',
    templateUrl: '/static/html/punch-filter-form.tpl',
    controller: ['$scope', '$modal', 'PunchFilter', function($scope, $modal, PunchFilter){
      $scope.punchFilter = new PunchFilter();
      $scope.checkAll = function(field){
        changeChecks(field, true);
      };
      $scope.uncheckAll = function(field){
        changeChecks(field, false);
      };
      function changeChecks(field, status){
        var obj = $scope.punchFilter[field]
        for(var key in obj){
          obj[key] = status;
        }
      };
      $scope.selectIDs = function(field){  
        var modalInstance = $modal.open({
          templateUrl: '/update/systems',
          controller: 'systemsController'
        })
        modalInstance.result.then(function () {
          console.log('modal finished');
        });
      };
    }]
  }
});

app.directive('punchDetails', function() {
  return {
    restrict: 'A',
    templateUrl: '/static/html/punch-details-table.tpl',
    controller: ['$scope','bunchManager', function($scope, bunchManager){
      $scope.getPunches = function(){
        return bunchManager.getPunches();
      };
    }]
  }
});

app.controller('punchController', ['$scope','Punch','bunchManager', function($scope, Punch, bunchManager) {
  $scope.punch = new Punch();
  $scope.save = function(){
    bunchManager.addPunch($scope.punch);
    $scope.punch.save();
    $scope.punch = new Punch();
  };
  $scope.hasRecents = function(){
    return bunchManager.getPunches().length > 0
  }
}]);

app.controller('systemsController', ['$scope', '$modalInstance' , function($scope, $modalInstance){
  $scope.systems = {}
  console.log("systemsController");
  $scope.showSystems= function(){
    console.log($scope.systems);
  }
}]);

app.controller('punchUpdateController', ['$scope', function($scope){
}]);
