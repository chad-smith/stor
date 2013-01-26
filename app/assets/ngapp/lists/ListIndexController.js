!function (angular) {
  'use strict'
  
  angular.module('controllers').controller('ListIndexController', function ($scope, List) {
    $scope.listView = { lists: List.query() };
  });
  
}(window.angular);