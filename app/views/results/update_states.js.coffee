$("#states_select").empty()
  .append("<%= escape_javascript(render(partial: 'location', collection: @states, as: :item)) %>")
  .prop('disabled', false)
  .selectpicker('refresh')

$("#cities_select").empty()
  .prop('disabled', true)
  .selectpicker('refresh')
