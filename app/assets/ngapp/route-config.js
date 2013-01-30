!function(angular) {
  'use strict';
  
  var routeConfig = angular.module('route-config', ['koovisa.services']).config(function(routeProvider) {

    routeProvider.appRoot = 'assets';

    routeProvider.resource('lists', function () {
      this.resource( { name: 'items', path: '' } );
    });

  });
  
  
  // debug
  routeConfig.run(function($route) {
    console.log($route.routes);
    /*angular.forEach($route.routes, function (route) {
      console.log(route);
    })*/
  });
  

}(window.angular);