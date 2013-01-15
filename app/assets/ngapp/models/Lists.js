!function (angular) {
  'use strict'
  
  angular.module('models').factory('Lists', function ($resource) {
    return $resource( 'api/lists/:id', {id: '@id'} );
  });

}(window.angular);