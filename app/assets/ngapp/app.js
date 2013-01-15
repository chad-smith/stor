!function(angular) {
  'use strict';

  var controllers = angular.module('controllers', []);
  var controllers = angular.module('models', ['ngResource']);
  var app = angular.module('app', ['controllers', 'models', 'route-config']);

  app.config(function($locationProvider) {
    $locationProvider.html5Mode(true);
  });


}(window.angular);
