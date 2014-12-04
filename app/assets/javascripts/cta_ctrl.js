(function() {
  "use strict";

  angular.module("app").controller("ctaCtrl", function($scope, $http) {

    $http.get("/api/v1/trains.json").then(function (response) {
      $scope.trains = response.data;
    });

    $scope.addTrain = function(train, status, label) {
      var newTrain = {name: train, status: status, label: label};
      $http.post('/api/v1/trains.json', {train: newTrain}).then(function(response) {

        }, function (error) {
          $scope.error = error.statusText;
        });
      $scope.trains.push(newTrain);
      $scope.trainLine = "";
      $scope.trainStatus = "";
      $scope.trainLabel = "";

    };

    $scope.statusOrder = function(status) {
      $scope.orderAttribute = status;
      $scope.sortDirection = !$scope.sortDirection;
    };

    window.scope = $scope;


  });
}());