!function(angular) {
  'use strict';
  
  angular.module('controllers')
    .controller('bodyController', function($scope, route) {
      $scope.route = route;
    });

}(window.angular);