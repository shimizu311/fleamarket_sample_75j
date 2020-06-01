$(function() {
  $(document).on('change', '.item-price__name__form', function() {
    var price = $(this).val();
    if (price < 300 || price > 9999999) {
      $('.item-price__name__form').css('border', '1px solid red');
      var html = `<div class='price-error'>300以上9999999以下で入力してください</div>`
      $('.price-error').css('color', 'red');
      $('.price-error').remove();
      $('.item-price__name').after(html);
      return html;
    } else {
      var result = price / 10;
      var num = Math.floor(result)
      var profit = price - num
    }
    $('.price-error').remove();
    $('.item-price__name__form').css('border', '');
    $('.item-price__commission__value').empty();
    $('.item-price__commission__value').append(`¥ ${num}`);
    $('.item-price__profit__value').empty();
    $('.item-price__profit__value').append(`¥ ${profit}`);
  });

  $(document).on('input', '#item_text', function() {
    var count = $(this).val().length;
    $('.now_count').text(count);
    if (count > 0 && count < 1001) {
      $('.item-exhibition__btn').prop('disabled', false);
      $('.item-wrapper__counter').css('color', 'black');
    } else {
      $('.item-exhibition__btn').prop('disabled', true);
      $('.item-wrapper__counter').css('color', 'red');
    }
  });
});