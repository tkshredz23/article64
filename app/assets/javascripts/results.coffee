# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#countries_select', (evt) ->
    $.ajax 'results/update_states',
      type: 'GET'
      dataType: 'script'
      data: {
        country: $("#countries_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(document).on 'change', '#states_select', (evt) ->
    $.ajax 'results/update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        country: $("#countries_select option:selected").val(),
        state: $("#states_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

