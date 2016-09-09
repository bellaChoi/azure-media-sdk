define [
  '../api'
  '../utils'
], (
  api
  utils
) ->
  locator = 

    ###*
     * https://msdn.microsoft.com/library/azure/hh974308.aspx
     * @param  {object}   opts 
     * @param  {Function} cb   
    ###
    makeSASLocator: (opts, cb) ->
      opts = opts || {}

      if not utils.validateParam { 'Type': 'require', 'AssetId': 'require', 'AccessPolicyId': 'require' }, opts
        return console.error '[error] missing parameters'

      api.request
        type: 'POST'
        url: utils.getUrl 'locator'
        data: opts
      ,
        success: (data) ->
          cb data if cb