!function (angular) {
  'use strict'
  
  angular.module('controllers').controller('ListDetailsController', function ($scope, $routeParams, List, Item) {
    var list_slug = $routeParams.lists_id;

    $scope.list = List.get({slug:list_slug}, function(list) {
      $scope.listItems = Item.query({list_slug: list_slug});
    });
  });

}(window.angular);