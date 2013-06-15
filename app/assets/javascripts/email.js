$(document).ready(function() {
  $('.btn-warning').click(function() {
    $('input').val('');
    $('textarea').val('');
    $('.alert-error').addClass('hide');
  });
  
  $('.close').click(function() {
    $(this).parent().addClass('hide')
  });
});  