require ['sdk', 'blob'], (AzureMedia, Blob) ->
  $("#output").hide()
  $("#file").bind 'change', (e) ->
    result = Blob.handleFile(e, 'https://mediasvcwgrrtp3lj13k1.blob.core.windows.net/asset-be52e13b-2da7-449c-9f87-5c915fe54f0d?sv=2012-02-12&sr=c&si=83bb931e-ab9c-449a-96ef-0fabb82ec480&sig=3zV%2BeBSzMuveHXzCw8j3K%2FM2TyZ4D4WVrEA8POAidmk%3D&se=2016-09-08T18%3A50%3A40Z')
    $("#output").show()
    $("#fileName").text result.name
    $("#fileSize").text result.size
    $("#fileType").text result.type
    
  $('#upload').on 'click', =>
    Blob.upload 
      onProgress: (data) ->
        console.log('progress: '+data)

  if not (window.File && window.FileReader && window.FileList && window.Blob)
    alert 'The File APIs are not fully supported in this browser.'

  sdk = new AzureMedia
    # client_id: 'mediasvcwgrrtp3lj13k1'
    client_id: 'snackk'
    # client_secret: 'kTido6D6N2DKHNr3WUnww1UFq69syOVIzRa0vw9pH85K4ly2ZOWRIkxaNzkm4ZV7UyyxNhAhBhJRk7a+GEqDGw=='
    client_secret: 'WpT/bLM3BQIQtRpdT5ai0n6TPaScl155lm6jgdlV2rw='
    onReady: ready

  ready = ->
    console.log 'ready'
    # sdk.asset.makeAsset
    #   Name: 'testasset'


    # sdk.assetFile.makeAssetsFile
    #   Name: 'testassetfile'
    #   ParentAssetId: 'nb:cid:UUID:be52e13b-2da7-449c-9f87-5c915fe54f0d'
    # nb:cid:UUID:561b7cc2-f641-4d04-8c85-f507b4c0a24f


    # sdk.accessPolicy.defineAccessPolicy
    #   Name: 'test_access_policy'
    #   DurationInMinutes: 440
    #   Permissions: 2
    # nb:pid:UUID:ffef90fa-0ed1-4c79-8e64-0ee2f854b365



    # sdk.locator.makeSASLocator
    #   Type: 1
    #   AssetId: 'nb:cid:UUID:be52e13b-2da7-449c-9f87-5c915fe54f0d'
    #   AccessPolicyId: 'nb:pid:UUID:ffef90fa-0ed1-4c79-8e64-0ee2f854b365'
    # https://mediasvcwgrrtp3lj13k1.blob.core.windows.net/asset-be52e13b-2da7-449c-9f87-5c915fe54f0d?sv=2012-02-12&sr=c&si=83bb931e-ab9c-449a-96ef-0fabb82ec480&sig=3zV%2BeBSzMuveHXzCw8j3K%2FM2TyZ4D4WVrEA8POAidmk%3D&se=2016-09-08T18%3A50%3A40Z


    # sdk.locator.reqcyId: 'nb:pid:UUID:5c34c944-6106-4bff-a929-b26ca448dffe'
  ready()
