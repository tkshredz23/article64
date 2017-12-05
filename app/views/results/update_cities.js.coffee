$("#cities_select").empty()
  .append("<%= escape_javascript(render(partial: 'location', collection: @cities, as: :item)) %>")
  .prop('disabled', false)
  .selectpicker('refresh')
