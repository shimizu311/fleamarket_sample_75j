$(document).on('turbolinks:load', function() {
  $('.image__list').click(function () {
    var $src = $(this).attr('src');
    $('.main__image').attr('src', $src);
  });
});