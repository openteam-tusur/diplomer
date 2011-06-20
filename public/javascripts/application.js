function selecting_discipline_type_on_diploma(){
  var items = $('.tabs_menu li');
  items.removeClass('current');
  items.first().addClass('current');
  $('.details_wrapper .details').children('li').hide();
  $('#courses').show();
  $('.tabs_menu li').click(function(){
    var element = "#"+$(this).children().attr('class');
    items.removeClass('current');
    $('.details_wrapper .details').children('li').hide();
    $(this).addClass('current');
    $(element).show();
    return false;
  });
};

function delete_discipline_item(){
  $(".details ol li .delete_link").live('ajax:success', function(){
    $(this).closest('li').fadeOut(300, function() {
      $(this).remove();
    });
  });
};

function adding_programm_item(){
  $('#new_course, #new_paper, #new_practice, .final_state_examination, .final_qualification_project').live('ajax:success', function(evt, data, status, xhr){
    var form_new = $(this).parent();
    var list = form_new.prev('.list');
    if ($(xhr.responseText)[0].tagName.toLowerCase() == 'form') {
      form_new.html(xhr.responseText);
    } else {
      list.find('.empty').remove();
      if (list.hasClass('state_examination_list') || list.hasClass('qualification_project_list')) {
        list.html('<li class="item">'+xhr.responseText+'</li>');
      } else {
        list.append('<li class="item">'+xhr.responseText+'</li>');
        $('.inputs input, input[id*=discipline_id], select').val('');
      };
    };
  });
};

function edit_programm_item(){
  $('.edit_link').live('click', function(){
    var path = $(this).attr('href');
    var line = $(this).closest('li');
    var form = '#';
    $.ajax({
      url: path,
      type: 'GET',
      success: function(data, status, xhr){
        line.addClass('form_edit').html(xhr.responseText);
        var form_id = line.find('form').attr('id');
        $('#'+form_id).live('ajax:success', function(evt, data, status, xhr){
          line.html(xhr.responseText);
        });
      }
    });
    return false;
  });
};

function sort_programm_item(){
  $('.courses_list, .papers_list, .practices_list').sortable({
    axis: 'y',
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'move',
    items: 'li',
    opacity: 0.7,
    scroll: true,
    update: function(){
      $.ajax({
        type: 'post',
        data: $('.courses_list').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('.courses_list').effect('highlight');
        },
        url: window.location.pathname + '/programm_items/sort'})
    }
  });
};

$(function() {
  selecting_discipline_type_on_diploma();
  adding_programm_item();
  edit_programm_item();
  sort_programm_item();

  if ($('.details ol li').length>0) {
    delete_discipline_item();
  };

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

  $('input[id*=discipline_term]').live('keyup.autocomplete', function (){
      $(this).autocomplete({
        source: '/suggestions/?utf8=✓&model=discipline',
        minLength: 2,
        select: function(event, ui){
          var id = '#'+$(this).attr('id').split('_discipline_term')[0]+'_discipline_id';
          $(id).val(ui.item.id);
        }
      })
  });

  $(".formtastic abbr, a[rel=tipsy], a.show_tipsy").tipsy({
    gravity: $.fn.tipsy.autoNS,
    html: true,
    live: true
  });

});

