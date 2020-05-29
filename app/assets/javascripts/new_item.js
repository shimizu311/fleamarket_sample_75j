// $(function() {
//   var file_field = document.querySelector('input[type=file]');
//   $('.test').change(function() {
//     var file = $('input[type=file]').prop('files')[0];
//     var fileReader = new FileReader();
//     fileReader.onloadend = function() {
//       var src = fileReader.result
//       var html = `<div class='item-image' data-image="${file.name}">
//                     <div class=' item-image__content'>
//                       <div class='item-image__content--icon'>
//                         <img src=${src} width="114" height="80" >
//                       </div>
//                     </div>
//                     <div class='item-image__operetion'>
//                       <div class='item-image__operetion--delete'>削除</div>
//                     </div>
//                   </div>`
//       $('.image-wrapper__image').before(html);
//     }
//     fileReader.readAsDataURL(file);
//   });
//   $(document).on("click", '.item-image__operetion--delete', function(){
//     //プレビュー要素を取得
//     var target_image = $(this).parent().parent()
//     //プレビューを削除
//     target_image.remove();
//     //inputタグに入ったファイルを削除
//     file_field.val("")
//   });
// });
$(function() {
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  $('.image-file').change(function() {
    var files = $('input[type=file]').prop('files')[0];
    $.each(this.files, function(i, file) {
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);

      if (num == 10){
        $('#image-box__container').css('display', 'none')
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html = `<div class='item-image' data-image="${file.name}">
                      <div class=' item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="114" height="80" >
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
        $('#image-box__container').before(html);
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });
  $(document).on("click", '.item-image__operetion--delete', function() {
    var target_image = $(this).parent().parent()
    target_image.remove();
    file_field.nodeValue("")
  });

  $(document).on('change', '.item-price__name__form', function() {
    var price = $(this).val();
    if (price < 300 || price > 9999999) {
      $('.item-price__name__form').css('border', '1px solid red');
      var html = `<div class='price-error'>300以上9999999以下で入力してください</div>`
      $('.price-error').css('color', 'red');
      $('.price-error').remove();
      $('.item-price__name').after(html);
      return
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