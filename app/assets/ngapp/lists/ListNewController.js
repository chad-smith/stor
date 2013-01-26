!function (angular) {
  'use strict'
  
  angular.module('controllers').controller('ListNewController', function ($scope, route, List) {
    $scope.saveList = function () {
      var list = new List($scope.newList);
      list.$save(function success() {
        route.gotoAction('index');
      });
    }
  });

}(window.angular);