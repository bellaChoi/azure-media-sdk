'use strict';

var router = require('express').Router()
var sas = require('shared-access-signature')

router.route('/')
.get(
  function (req, res, next) {
    // console.log('test - get')
    // var url = req.query.url
    // var sharedAccessKeyName = req.query.name
    // var sharedAccessKey = req.query.key
    // var currentDate = new Date()
    // var expiry = currentDate.getTime() / 1000 + 3600 // We require expiry time in seconds since epoch. 

    // var signature = sas.generateServiceBusSignature(url, sharedAccessKeyName, sharedAccessKey, expiry)
    // console.log(signature)

    // res.json({
    //   result: signature
    // })
  }
)
.post(
  function (req, res, next) {
    var azure = require('azure-storage')
    var service = azure.createBlobService('snackkmediastorage', 'yzASkrT08d2JsoG3NOiRXmo92S8DLqq8q2yQh4UlJvVd5gIRHzfv2e6EsG4lx3f/oCMnbGyJQYpZAp43f4g+7w==')
    
    var startDate = new Date()
    var expiryDate = new Date(startDate)
    expiryDate.setMinutes(startDate.getMinutes() + 100)
    startDate.setMinutes(startDate.getMinutes() - 100)
     
    var sharedAccessPolicy = {
      AccessPolicy: {
        Permissions: azure.BlobUtilities.SharedAccessPermissions.READ | azure.BlobUtilities.SharedAccessPermissions.ADD || azure.BlobUtilities.SharedAccessPermissions.WRITE || azure.BlobUtilities.SharedAccessPermissions.CREATE,
        Start: startDate,
        Expiry: expiryDate
      }
    }
     
    var token = service.generateSharedAccessSignature('snackkcontainer1', req.body.blob, sharedAccessPolicy)
    var sasUrl = service.getUrl('snackkcontainer1', req.body.blob, token)

    console.log('sasUrl: '+sasUrl)




    // console.log('test')

    // var url = req.body.url
    // var sharedAccessKeyName = req.body.name
    // var sharedAccessKey = req.body.key
    // var currentDate = new Date()
    // var expiry = currentDate.getTime() / 1000 + 3600 // We require expiry time in seconds since epoch. 

    // var signature = sas.generateServiceBusSignature(url, sharedAccessKeyName, sharedAccessKey, expiry)
    // console.log(signature)

    res.json({
      result: sasUrl
    })
  }
)

module.exports = router
