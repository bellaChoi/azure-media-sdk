require ['sdk', 'blob'], (AzureMedia, Blob) ->
  $("#output").hide()

  $("#file").bind 'change', (e) ->
    result = Blob.handleFile(e, 'https://snackkmediastorage.blob.core.windows.net/asset-cb4be16c-b16f-4a84-8cb9-c67399f6617d?sv=2012-02-12&sr=c&si=72ea02aa-4b27-4f7f-ae96-fd7e16471c4b&sig=qpeC6M3hnowoR%2FZ1Izz%2Ft09kiFQoA1b0%2BHrR0rzcxCc%3D&se=2016-09-13T10%3A03%3A59Z')
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
    # client_id: 'snackkmediastorage'
    client_id: 'snackkmedia'
    # client_secret: 'yzASkrT08d2JsoG3NOiRXmo92S8DLqq8q2yQh4UlJvVd5gIRHzfv2e6EsG4lx3f/oCMnbGyJQYpZAp43f4g+7w==+GEqDGw=='
    client_secret: 'dv1jYFvWRyOKxl+iS0tMDAlItFTqbYESMGhFT+uUoj8='
    onReady: ready

  ready = ->
    console.log 'ready'

    # sdk.asset.makeAsset
    #   Name: 'snackk-asset'
    # , (res) ->
    #     makeAssetsFile res.d.Id

    # makeAssetsFile = (id) ->
    #   sdk.assetFile.makeAssetsFile
    #     Name: 'snackk-assetfile'
    #     ParentAssetId: id
    #   , (res) ->
    #       # res.d.Id
    #       defineAccessPolicy id

    # defineAccessPolicy = (id) ->
    #   sdk.accessPolicy.defineAccessPolicy
    #     Name: 'snackk-access-policy'
    #     DurationInMinutes: 440
    #     Permissions: 2
    #   , (res) ->
    #       sdk.locator.makeSASLocator
    #         Type: 1
    #         AssetId: id
    #         AccessPolicyId: res.d.Id
    #       , (data) ->
    #           $("#file").bind 'change', (e) ->
    #             result = Blob.handleFile(e, data.d.Path)
    #             $("#output").show()
    #             $("#fileName").text result.name
    #             $("#fileSize").text result.size
    #             $("#fileType").text result.type
            
          


    # sdk.locator.reqcyId: 'nb:pid:UUID:5c34c944-6106-4bff-a929-b26ca448dffe'
  ready()
