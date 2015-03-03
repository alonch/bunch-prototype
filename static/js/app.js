var app = angular.module('turnoverSuncor',['ui.bootstrap']);

app.config(function($interpolateProvider){
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');
});

app.factory('UIHelper', [function() {
  return {
    changeChecks: function(instance, field, status){
      var obj = instance[field]
      for(var key in obj){
        obj[key] = status;
      }
    } 
  };
}]);

app.factory('PunchFilter', [function() {
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

app.factory('$', function(){ 
  return $;
});

app.factory('bunchManager', ['$http', function($http) {
  var bunchManager = {
    punches: [],
    getPunches: function(){
      return this.punches
    },
    add: function(punch){
      this.punches.push(punch);
    },
    pullAll: function(){
      var scope = this;
      var promise = $http.get('/rest/punch', scope).
        success(function(data, status, headers, config) {
          scope.punches = data;
        }).
        error(function(data, status, headers, config) {
          scope.punches = [];
        });
      return promise;
    
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
    controller: ['$scope', '$modal', 'PunchFilter', 'UIHelper', function($scope, $modal, PunchFilter, UIHelper){
      $scope.punchFilter = new PunchFilter();
      $scope.checkAll = function(field){
        UIHelper.changeChecks($scope.punchFilter, field, true);
      };
      $scope.uncheckAll = function(field){
        UIHelper.changeChecks($scope.punchFilter, field, false);
      };
      
      $scope.selectIDs = function(field){  
        var modalInstance = $modal.open({
          templateUrl: '/update/'+field,
          controller: 'systemsController'
        })
        modalInstance.result.then(function (ids) {
          $scope.punchFilter[field] = ids;
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

app.controller('punchController', ['$scope', '$', '$timeout','Punch','bunchManager', function($scope, $, $timeout, Punch, bunchManager) {
  $scope.punch = new Punch();
  $scope.save = function(){
    bunchManager.add($scope.punch);
    $scope.punch.save();
    $scope.punch = new Punch();
  };
  $scope.hasRecents = function(){
    return bunchManager.getPunches().length > 0
  }
  $scope.refreshPunches = function(){
    bunchManager
      .pullAll()
        .then(function(){
          $timeout(function(){
            $('html, body').animate({
              scrollTop: $('#punches').offset().top
            }, 2000); 
          },0,false);
        });
  }
}]);

app.controller('systemsController', ['$scope', '$modalInstance', 'UIHelper' , function($scope, $modalInstance, UIHelper){
  $scope.systems = {}
  $scope.finish = function(){
    var activeKeys = []
    for( key in $scope.systems){ 
      if($scope.systems[key]){ 
        activeKeys.push(key); 
      }
    }
    $modalInstance.close(activeKeys.join(", "));
  };
  $scope.cancel = function(){
    $modalInstance.dismiss("cancel");
  };
  $scope.changeAll = function(on){
    UIHelper.changeChecks($scope, "systems", on)
  };
}]);
