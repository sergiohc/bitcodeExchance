$(document).ready ->

  $('#refresh').click ->
    aux = $('#currency').val()
    $('#currency').val($('#currency_destination').val())
    $('#currency_destination').val(aux)
    getCurrency()

  $('#quantity').change ->
   getCurrency()

  $('#currency').change ->
   getCurrency()

  $('#currency_destination').change ->
   getCurrency()

  getCurrency = () ->
      if $('#quantity').val() <= 0 then return
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)

      return false;