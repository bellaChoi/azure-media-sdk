define [
  './const'
], (
  C
) ->
  utils = 
    getUrl: (endpoint) ->
      C.BASE_URL + C.ENDPOINT[endpoint]


    pad: (number, length) ->
      str = '' + number
      while str.length < length
        str = '0' + str
      str
    

    validateParam: (validate, data) ->
      for key, value of validate
        if not @validate[value] data, key
          return false
      true
        

    validate:
      require: (obj, key) ->
        not(typeof obj[key] is 'undefined')
