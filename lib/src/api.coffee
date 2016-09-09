define [
  'jquery'
  'lodash'
  './token'
], (
  $
  _
  token
) ->
  api = 
    request: (opts, cb) ->
      if opts.data
        opts.data = JSON.stringify opts.data

      $.ajax _.assign(opts, 
        headers: 
          'Content-Type': 'application/json;odata=verbose'
          'Accept': 'application/json;odata=verbose'
          'Authorization': "Bearer #{token.get().access_token}"
          'x-ms-version': '2.11'
          'DataServiceVersion': '3.0'
          'MaxDataServiceVersion': '3.0'
        success: (data, status) ->
          cb.success data, status if cb and cb.success
        error: (xhr, desc, err) ->
          debugger
          cb.error xhr, desc, err if cb and cb.error
        )
