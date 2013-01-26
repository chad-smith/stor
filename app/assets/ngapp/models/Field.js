!function (angular) {
  'use strict'
  
  angular.module('models').factory('Field', function ($resource) {
    return $resource( 'api/lists/:list_slug/items/:itemid/fields/:field_id', {field_id: '@id'} );
  });

}(window.angular);