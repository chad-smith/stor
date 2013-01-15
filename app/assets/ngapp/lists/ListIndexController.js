!function (angular) {
  'use strict'
  
  angular.module('controllers').controller('ListIndexController', function ($scope, Lists) {
    $scope.listView = { lists: Lists.query() };
  });
  
}(window.angular);