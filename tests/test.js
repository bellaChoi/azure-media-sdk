'use strict'

var AzureService  = require('node-ams-sdk')
var serviceConfig = {
  client_id: 'snackk',
  client_secret: 'WpT/bLM3BQIQtRpdT5ai0n6TPaScl155lm6jgdlV2rw='
}
 
// var amsService = new AzureService(serviceConfig)
// amsService.test()

// amsService.createAsset({
//   Name: 'test_video_1.mp4',
//   Options: 0
// }, function (res) {
//   console.log(res)
// })

// var azure = require('azure-storage')

// var service = azure.createBlobService('mediasvcwgrrtp3lj13k1', 'kTido6D6N2DKHNr3WUnww1UFq69syOVIzRa0vw9pH85K4ly2ZOWRIkxaNzkm4ZV7UyyxNhAhBhJRk7a+GEqDGw==')
// var serviceProperties = {
//   Cors: {
//     CorsRule: [{
//       AllowedOrigins: ['*'],
//       AllowedMethods: ['GET'],
//       AllowedHeaders: [],
//       ExposedHeaders: [],
//       MaxAgeInSeconds: 60
//     }]
//   }
// }

// service.setServiceProperties(serviceProperties, function (res) {
//   console.log(res)
// })

// var setcrosproperties = require('./setcrosproperties.js');

// // setCors(MY_ACCOUNT_URL, MY_ACCOUNT_NAME, MY_ACCOUNT_HOST, accountKey)
// setcrosproperties.setCors(
//     'https://'+'mediasvcwgrrtp3lj13k1'+'.blob.core.windows.net',
//     'mediasvcwgrrtp3lj13k1',
//     'mediasvcwgrrtp3lj13k1'+'.blob.core.windows.net',
//     'kTido6D6N2DKHNr3WUnww1UFq69syOVIzRa0vw9pH85K4ly2ZOWRIkxaNzkm4ZV7UyyxNhAhBhJRk7a+GEqDGw==');