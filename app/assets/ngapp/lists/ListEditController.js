!function (angular) {
  'use strict'
  
  angular.module('controllers').controller('ListEditController', function ($scope, $routeParams, route, List) {
    $scope.list = List.get({ slug: $routeParams.lists_id });

    $scope.addField = function (newField) {
      if (angular.isUndefined($scope.list.schema_fields)) {
        $scope.list.schema_fields = [];
      };

      $scope.list.schema_fields.push(newField);
    }

    $scope.removeField = function (field) {
      $scope.list.schema_fields = _.reject($scope.list.schema_fields, function(existingField) {
        console.log(existingField);
        return existingField == field;
      });
    }

    $scope.saveList = function () {
      List.update([], $scope.list, function success(list) {
        route.gotoLink( {action: 'details', lists_id: list.slug});
      });
    }
  });

}(window.angular);