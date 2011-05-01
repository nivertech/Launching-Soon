$(function() {
  $('.text').focus(function() { $('label').hide(); });
  $('.text').blur(function() {  if ( ! $(this).val().length) $('label').show(); });
});