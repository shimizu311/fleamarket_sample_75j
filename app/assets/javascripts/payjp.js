$(document).on('turbolinks:load', function () {
  let form = $('#card-form');
  Payjp.setPublicKey('pk_test_d77268778411e4eb641e2ba4');
  $(document).on('click', '#submit-card', function (e) {
    e.preventDefault();
    $('#submit-card').prop('disabled', true);

    let card = {
      number: $('.card_number').val(),
      exp_month: $('.exp_month').val(),
      exp_year: $('.exp_year').val(),
      cvc: $('.cvc').val()
    };

    Payjp.createToken(card, function (s, response) {
      if (response.error) {
        alert('カード情報が正しくありません')
        $('#submit-card').prop('disabled', false);
      } else {
        $('.card_number').removeAttr('name');
        $('.exp_month').removeAttr('name');
        $('.exp_year').removeAttr('name');
        $('.cvc').removeAttr('name');
        let token = response.id;
        form.append($('<input type="hidden" name="payjp_token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});