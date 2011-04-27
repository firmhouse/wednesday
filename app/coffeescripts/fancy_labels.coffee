$(document).ready ->
  $(".fancy_label input, .fancy_label textarea").focus ->
    $(this).parents('.fancy_label').find('label').hide()
    
  $(".fancy_label input, .fancy_label textarea").blur ->
    $(this).parents('.fancy_label').find('label').show() if $(this).val().length is 0
    
  $(".fancy_label label, .fancy_label textarea").click -> 
    $(this).parents('.fancy_label').find('input').focus()
    
  for input in $(".fancy_label input, .fancy_label textarea")
    $(input).parents('.fancy_label').find('label').hide() if $(input).val().length > 0