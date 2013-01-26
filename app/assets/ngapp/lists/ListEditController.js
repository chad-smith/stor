!function (angular) {
  'use strict'
  
  angular.module('controllers').controller('ListEditController', function ($scope, $routeParams, route, List) {
    $scope.list = List.get({ slug: $routeParams.lists_id });

    $scope.addField = function (newField) {
      $scope.list.schema_fields.push(newField);
    }

    $scope.saveList = function () {
      List.update([], $scope.list, function success(list) {
        route.gotoLink( {action: 'details', lists_id: list.slug});
      });
    }
  });

}(window.angular);