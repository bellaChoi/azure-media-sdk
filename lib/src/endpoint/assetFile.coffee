define [
  '../api'
  '../utils'
], (
  api
  utils
) ->
  assetFile = 
    ###*
     * make assets file
     * https://msdn.microsoft.com/library/azure/hh974275.aspx
     * @param  {object}   opts
     * @param  {object} cb
    ###
    makeAssetsFile: (opts, cb) ->
      opts = opts || {}

      if not utils.validateParam { 'Name': 'require', 'ParentAssetId': 'require' }, opts
        return console.error '[error] missing parameters'

      api.request
        type: 'POST'
        url: utils.getUrl 'file'
        data: opts
      , 
        success: (data) ->
          cb data if cb