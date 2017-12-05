console.log('here sucker')

$("#cities_select").empty()
  .append("<%= escape_javascript(render(partial: 'city', collection: @cities)) %>")

$("#cities_select").selectpicker('refresh');
