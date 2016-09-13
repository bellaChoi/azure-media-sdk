define [
  'jquery'
], (
  $
) ->
  _oauthUrl = 'https://wamsprodglobal001acs.accesscontrol.windows.net/v2/OAuth2-13'
  _token = 
    access_token: "http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=snackkmedia&urn%3aSubscriptionId=19a7d3f5-dd18-4244-bfb4-f4eacf1d99cb&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1473754498&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=0aUeIbrZJIv%2bfDo3bIYBnEL72IZZBENBGz9EFrP9d4s%3d"

  token = 
    load: (opts, cb) ->
      if not _token
        $.ajax
          url: _oauthUrl
          type: 'POST'
          data: opts
          # beforeSend: (xhr) ->
          #   for key, value of opts
          #     console.log "key: #{key}"
          #     xhr.setRequestHeader key, value
          success: (data, status) ->
            debugger
            _token = data
            cb.success data, status if cb and cb.success
          error: (xhr, desc, err) ->
            cb.error xhr, desc, err if cb and cb.error

      else
        cb.success _token if cb and cb.success


    get: ->
      _token