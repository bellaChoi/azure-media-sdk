define [
  'jquery'
  'lodash'
  'utils'
  './token'
], (
  $
  _
  utils
  token
) ->
  # Each file will be split in 256 KB
  _maxBlockSize = 256 * 1024
  _numberOfBlocks = 1
  _selectedFile = null
  _currentFilePointer = 0
  _totalBytesRemaining = 0
  _blockIds = new Array()
  _blockIdPrefix = "block-"
  _submitUri = null
  _bytesUploaded = 0
    
  blob = 


    # Read the file and find out how many blocks we would need to split it.
    handleFile: (e, sas) ->
      _currentFilePointer = 0
      _totalBytesRemaining = 0
      files = e.target.files
      _selectedFile = files[0]

      fileSize = _selectedFile.size
      if fileSize < _maxBlockSize
        _maxBlockSize = fileSize
        console.log "max block size = #{_maxBlockSize}"
      
      _totalBytesRemaining = fileSize
      if fileSize % _maxBlockSize is 0
        numberOfBlocks = fileSize / _maxBlockSize
      else
        numberOfBlocks = parseInt(fileSize / _maxBlockSize, 10) + 1

      console.log "total blocks = #{numberOfBlocks}"

      baseUrl = sas

      indexOfQueryStart = baseUrl.indexOf("?")
      _submitUri = baseUrl.substring(0, indexOfQueryStart) + '/' + _selectedFile.name + baseUrl.substring(indexOfQueryStart)
      console.log _submitUri

      return {
        name: _selectedFile.name
        size: _selectedFile.size
        type: _selectedFile.type
      }


    upload: (cb) ->
      reader = new FileReader()
      @uploadFileInBlocks reader

      reader.onloadend = (evt) =>
        # DONE == 2
        if (evt.target.readyState is FileReader.DONE)
          uri = "#{_submitUri}&comp=block&blockid=#{_blockIds[_blockIds.length - 1]}"
          requestData = new Uint8Array(evt.target.result)
          $.ajax
            url: uri
            type: "PUT"
            data: requestData
            processData: false
            headers: 
              'Authorization': "Bearer #{token.get().access_token}"
              'x-ms-version': '2013-08-15'
              'Content-Length': requestData.length
              'x-ms-blob-type': 'BlockBlob'
              
            success: (data, status) ->
              console.log data
              console.log status
              bytesUploaded += requestData.length
              percentComplete = ((parseFloat(bytesUploaded) / parseFloat(_selectedFile.size)) * 100).toFixed(2)

              if cb and cb.onProgress
                cb.onProgress percentComplete

              @uploadFileInBlocks reader
            error: (xhr, desc, err) ->
              console.log desc
              console.log err
     

    uploadFileInBlocks: (reader) ->
      if _totalBytesRemaining > 0
        console.log "current file pointer = #{_currentFilePointer} bytes read = #{_maxBlockSize}"

        fileContent = _selectedFile.slice(_currentFilePointer, _currentFilePointer + _maxBlockSize)
        blockId = _blockIdPrefix + utils.pad(_blockIds.length, 6)

        console.log "block id = #{blockId}"

        _blockIds.push btoa(blockId)
        reader.readAsArrayBuffer fileContent

        _currentFilePointer += _maxBlockSize
        _totalBytesRemaining -= _maxBlockSize

        if _totalBytesRemaining < _maxBlockSize
          _maxBlockSize = _totalBytesRemaining

      else
        @commitBlockList _blockIds
     

    commitBlockList: ->
        uri = _submitUri + '&comp=blocklist'
        console.log uri

        requestBody = '<?xml version="1.0" encoding="utf-8"?><BlockList>'
        for item in _blockIds
          requestBody += "<Latest>#{item}</Latest>"
        requestBody += '</BlockList>'

        console.log requestBody

        $.ajax
          url: uri,
          type: "PUT",
          headers: 
            'Authorization': "Bearer #{token.get().access_token}"
            'x-ms-version': '2013-08-15'
            'Content-Length': requestBody.length
            'x-ms-blob-content-type': _selectedFile.type
          data: requestBody
          success: (data, status) ->
            console.log data
            console.log status
          error: (xhr, desc, err) ->
            console.log desc
            console.log err


