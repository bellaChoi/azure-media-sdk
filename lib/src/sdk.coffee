define [
  'jquery'
  'lodash'
  './token'
  './api'
  './utils'
  'endpoint/asset'
  'endpoint/assetFile'
  'endpoint/accessPolicy'
  'endpoint/locator'
], (
  $
  _
  token
  api
  utils
  Asset
  AssetFile
  AccessPolicy
  Locator
) ->

  _config = null


  class AzureMedia
    asset: Asset
    assetFile: AssetFile
    accessPolicy: AccessPolicy
    locator: Locator

    ###*
     * constructor
     * @param  {object} opts 
     * @property {function} opts.onReady : ready for connect to Azure media service
     * @property {string} opts.client_id 
     * @property {string} opts.client_secret
    ###
    constructor: (opts) ->
      _config = opts

      # @getToken 
      #   success: (data, status) =>
      #     api
      #       url: 'https://media.windows.net/'
      #       type: 'GET'
      #     ,
      #       success: (data, status) =>
      #         debugger
      #       error: (xhr, desc, err) =>
      #         debugger
      #         _baseUrl = 'https://wamsos1clus001rest-hs.cloudapp.net/api/'
              # _config.onReady() if _config.onReady
      @


    getToken: (cb) ->
      token.load 
        grant_type: 'client_credentials'
        scope: 'urn:WindowsAzureMediaServices'
        client_id: _config.client_id
        client_secret: _config.client_secret
      , cb



