define [
  'sdk'
], (
  AzureMedia
) ->
  ready = ->
    sdk.makeAsset
      name: 'test_video_1.mp4'
    , makeAssetsFile

  makeAssetsFile = (opts) ->
    sdk.makeAssetsFile opts, (res) ->
      debugger

  sdk = new AzureMedia
    client_id: 'snackk'
    client_secret: 'WpT/bLM3BQIQtRpdT5ai0n6TPaScl155lm6jgdlV2rw='
    onReady: ready

