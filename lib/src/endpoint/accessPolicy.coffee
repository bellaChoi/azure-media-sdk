define [
  '../api'
  '../utils'
], (
  api
  utils
) ->
  accessPolicy = 
    
    ###*
     * make access policy
     * https://msdn.microsoft.com/library/azure/hh974297.aspx
     * @param  {object}   opts 
     * @param  {Function} cb
    ###
    defineAccessPolicy: (opts, cb) ->
      opts = opts || {}

      if not utils.validateParam { 'Name': 'require', 'DurationInMinutes': 'require', 'Permissions': 'require' }, opts
        return console.error '[error] missing parameters'

      api.request
        type: 'POST'
        url: utils.getUrl 'policy'
        data: opts
      ,
        success: (data) ->
          cb data if cb