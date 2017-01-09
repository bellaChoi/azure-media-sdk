'use strict'

var express = require('express'),
  app = express()
var http = require('http')
var bodyParser = require('body-parser')
app.disable('x-powered-by')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

var routes = {
  '/sas': require('./routes/sas')
}

// var AzureService  = require('node-ams-sdk')
// var serviceConfig = {
//   client_id: 'snackk',
//   client_secret: 'WpT/bLM3BQIQtRpdT5ai0n6TPaScl155lm6jgdlV2rw='
// }
//

for (var k in routes) {
  app.use(k, routes[k])
}

// enable cors
app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Credentials', 'true')
  res.header('Access-Control-Request-Method', 'GET,PUT,POST,DELETE,OPTIONS')
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
  res.header('Access-Control-Allow-Headers', [
    'Authorization',
    'Content-Type',
    'If-Modified-Since',
    'X-HTTP-Method-Override'
  ].join(', '))

  if (req.method === 'OPTIONS') {
    res.sendStatus(204)
  } else {
    next()
  }
})

http.createServer(app).listen('3000', function () {})

// var amsService = new AzureService(serviceConfig)
// amsService.test()

// amsService.createAsset({
//   Name: 'test_video_1.mp4',
//   Options: 0
// }, function (res) {
//   console.log(res)
// })

// var azure = require('azure-storage')
// var service = azure.createBlobService('snackkmediastorage', 'yzASkrT08d2JsoG3NOiRXmo92S8DLqq8q2yQh4UlJvVd5gIRHzfv2e6EsG4lx3f/oCMnbGyJQYpZAp43f4g+7w==')
// var serviceProperties = {
//   Cors: {
//     CorsRule: [{
//       AllowedOrigins: ['*'],
//       AllowedMethods: ['GET', 'POST', 'PUT'],
//       AllowedHeaders: [],
//       ExposedHeaders: [],
//       MaxAgeInSeconds: 60
//     }]
//   }
// }

// service.createContainerIfNotExists('snackkcontainer1', {
//   publicAccessLevel: 'Blob'
// }, function (err, result, res) {
//   if (!err) {
//     console.log('----result----')
//     console.log(result)
//   }
//   console.log('----res----')
//   console.log(res)
// })

// service.setServiceProperties(serviceProperties, function (res) {
//   console.log('-----set properties-----')
//   console.log(res)
// }, function (res) {
//   console.log('-----set properties2-----')
//   console.log(res)
// })

// var sas = require('shared-access-signature')
// var url = 'https://snackkmediastorage.blob.core.windows.net/snackkcontainer1/snackkmediastorage'
// var sharedAccessKeyName = 'snackkmediastorage'
// var sharedAccessKey = 'yzASkrT08d2JsoG3NOiRXmo92S8DLqq8q2yQh4UlJvVd5gIRHzfv2e6EsG4lx3f/oCMnbGyJQYpZAp43f4g+7w==+GEqDGw=='
// var currentDate = new Date()
// var expiry = currentDate.getTime() / 1000 + 3600 // We require expiry time in seconds since epoch. 

// var signature = sas.generateServiceBusSignature(url, sharedAccessKeyName, sharedAccessKey, expiry)
// console.log(signature)

// var setcrosproperties = require('./setcrosproperties.js');

// // setCors(MY_ACCOUNT_URL, MY_ACCOUNT_NAME, MY_ACCOUNT_HOST, accountKey)
// setcrosproperties.setCors(
//     'https://'+'mediasvcwgrrtp3lj13k1'+'.blob.core.windows.net',
//     'mediasvcwgrrtp3lj13k1',
//     'mediasvcwgrrtp3lj13k1'+'.blob.core.windows.net',
//     'kTido6D6N2DKHNr3WUnww1UFq69syOVIzRa0vw9pH85K4ly2ZOWRIkxaNzkm4ZV7UyyxNhAhBhJRk7a+GEqDGw==');