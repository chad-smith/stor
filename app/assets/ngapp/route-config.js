!function(angular) {
  'use strict';
  
  var routeConfig = angular.module('route-config', ['koovisa.services']).config(function(routeProvider) {

    routeProvider.appRoot = 'assets';

    routeProvider.resource('lists');

  });
  
  /*
  // debug
  routeConfig.run(function($route) {
    console.log($route.routes);
  });
  */

}(window.angular);