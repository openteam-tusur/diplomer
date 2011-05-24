function diploma_disciplines(){
  var items = $('.tabs_menu li');
  items.removeClass('current');
  items.first().addClass('current');
  $('.details_wrapper .details').children('li').hide();
  $('#courses').show();
  $('.tabs_menu a').click(function(){
    var element = "#"+$(this).attr('class');
    items.removeClass('current');
    $('.details_wrapper .details').children('li').hide();
    $(this).parent('li').addClass('current');
    $(element).show();
    return false;
  });
};

function delete_discipline(){
  $(".details table tr td:first-child").bind('ajax:complete', function(){
    $(this).parent('tr').fadeOut(300, function() { $(this).remove(); });
  });
};

$(function() {
  if ($('.details table').length>0) {
    delete_discipline();
  };
  diploma_disciplines();
  $(".focus_first:first").focus();

  $("form.formtastic li.date input").datepicker({
    showOn: "button",
    buttonImage: "/images/datepicker.png",
    buttonImageOnly: true,
    buttonText: "Выбрать",
    yearRange: 'c-33:c+5',
    showOtherMonths: true,
    changeMonth: true,
    changeYear: true
  });

  $('#diploma_speciality_term').autocomplete({
    source: '/suggestions/?utf8=✓&model=speciality',
    minLength: 2,
    select: function(event, ui){
      $('#diploma_speciality_id').val(ui.item.id);
    }
  });

  $('input[id*=discipline_term]').autocomplete({
    source: '/suggestions/?utf8=✓&model=discipline',
    minLength: 2,
    select: function(event, ui){
      var id = '#'+$(this).attr('id').split('_discipline_term')[0]+'_discipline_id';
      $(id).val(ui.item.id);
    }
  });

  $(".formtastic abbr, a[rel=tipsy], a.show_tipsy").tipsy({
    gravity: $.fn.tipsy.autoNS,
    html: true,
    live: true
  });

});

