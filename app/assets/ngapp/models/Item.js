!function (angular) {
  'use strict'
  
  angular.module('models').factory('Item', function ($resource) {
    return $resource( 'api/lists/:list_slug/items/:item_id', {item_id: '@id'} );
  });

}(window.angular);