$(document).on('turbolinks:load', function(){
  $(function(){

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box" id="update_btn_${count}">
                        <span>変更</span>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      $('.label-box').before(html);
      // return html;
    }

    // 投稿編集時
    //items/:i/editページへリンクした際のアクション=======================================
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      //プレビューにidを追加
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      $('.update-box').each(function(index, box){
        $(box).attr('id', `update_btn_${index}`);
      })
      var count = $('.preview-box').length;
      //プレビューが10あるときは、投稿ボックスを消しておく
      if (count == 10) {
        $('.label-box').hide();
      }
    }
    // // 既存の画像が削除された時
    // $(document).on('click', '.delete-box', function() {
    //   var deleteFiles = $('.delete-box')
    //   var index = deleteFiles.index(this);

    //   $("input[type='file']").eq(index).();
      
    // })


    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          // var prevContent = $('.label-box').prev();
          // $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが10個あったらラベルを隠す 
        if (count == 10) { 
          $('.label-box').hide();
        }

        //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す=============
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 

        //ラベルのidとforの値を変更
        if(count < 10){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });
    $(document).on('click', '.update-box', function() {
      var updateFiles = $('.update-box')
      var index = updateFiles.index(this);

      $("input[type='file']").eq(index).click();
    })
    

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      //新規登録時と編集時の場合分け==========================================================

      //新規投稿時
      //削除用チェックボックスの有無で判定
      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        //フォームの中身を削除 
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        //10個めが消されたらラベルを表示
        if (count == 9) {
          $('.label-box').show();
        }
        if(id < 10){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      } else {

        //投稿編集時
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
        
        //10個めが消されたらラベルを表示
        if (count == 9) {
          $('.label-box').show();
        }

        //ラベルのwidth操作
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 10){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
          // $('.hidden-field').prop('disabled', false);
        }
      }
      //=============================================================================
    });
  });
});