!function(angular) {
  'use strict';
  
  angular.module('controllers')
    .controller('bodyController', function($scope) {
      $scope.test = 'hello!';
    });

}(window.angular);