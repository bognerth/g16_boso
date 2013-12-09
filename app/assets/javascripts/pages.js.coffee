jQuery ->
  $('#import_form').hide()
  $('.datatable').dataTable
    sPaginationType: "full_numbers" #"foundation"
    bJQueryUI: true
    #bProcessing: true
    #bServerSide: true
  $('.best_in_place').best_in_place()
