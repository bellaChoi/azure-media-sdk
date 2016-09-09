define [
  '../api'
  '../utils'
], (
  api
  utils
) ->
  asset = 

    ###*
     * make assets
     * https://azure.microsoft.com/ko-kr/documentation/articles/media-services-rest-get-started/#upload
     * @param  {object} opts
     * @property {string} opts.Name : file Name
     * @property {string} opts.Options : default 0
     * @param  {object} cb
    ###
    makeAsset: (opts, cb) ->
      opts = opts || {}

      if not opts.Options
        opts.Options = 0

      if not utils.validateParam { 'Name': 'require' }, opts
        return console.error '[error] missing parameters'

      api.request
        type: 'POST'
        url: utils.getUrl 'assets'
        data: opts
      , 
        success: (data) ->
          cb data if cb

