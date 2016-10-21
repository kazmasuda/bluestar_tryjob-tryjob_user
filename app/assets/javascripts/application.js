// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* ホーム検索タブ */
$(document).ready(function(){

  $('div.search-tabs div').hover(function(){

  var tabkeys = $(this).attr('id');
  var tabkey = tabkeys.split("-")[0]
  var tabbody;
  $.each($("[name='tab[]']"),function(){
    tabbody = $(this).attr('id')
    if(tabbody == tabkey + '-block'){
      /* ホバーしているタブ */
      $(this).animate({height:'show'}, 300);//.css('display', 'block');
      $('#' + tabbody.split("-")[0] + '-tab').css('background-color', '#ffb74d');
      $('#' + tabbody.split("-")[0] + '-tab').children().css('color', '#fff3e0');
    }else{
      $(this).css('display', 'none');
      $('#' + tabbody.split("-")[0] + '-tab').css('background-color', '#fff');
      $('#' + tabbody.split("-")[0] + '-tab').children().css('color', '#ffcc80');
    }
  });
  return false;
  },function() {return false;});

/* ステップリスト開閉マウスオーバー */
  $('.collapsible-header').hover(function(){
    //$(this).trigger("click");
    $(this).css('opacity','0.6');
    return false;
  },function() {
    $(this).css('opacity','1')
    return false;
  });

  /* STEP arrow */
  var step;
  var flg = true;
  $('.collapsible-header').click(function(){
    $('.collapsible-header').children('i').css({'transform':'rotateZ(0deg)'});
    if(step == $(this).text()){
      if(flg){
        $(this).children('i').css({'transform':'rotateZ(90deg)','transition':'transform .3s'});
        flg = false;
      }else{
        $(this).children('i').css({'transform':'rotateZ(0deg)'});
        flg = true;
      }
    }else{
      $(this).children('i').css({'transform':'rotateZ(90deg)','transition':'transform .3s'});
      flg = false;
    }
    step = $(this).text();
  });

  /*「案件探す」ボタン*/
  $('.moveBtn').click(function(){
    $('body').delay(100).animate({
      scrollTop: $(document).height()
    },500);
  });

});
