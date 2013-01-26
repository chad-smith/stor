!function (angular) {
  'use strict'
  
  angular.module('models').factory('List', function ($resource) {
    return $resource( 'api/lists/:slug', {slug: '@slug'}, { update: {method:'put'} } );
  });

}(window.angular);