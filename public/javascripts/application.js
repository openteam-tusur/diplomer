function work_place_status_change() {
  var student_block = $("fieldset.student", $("#work_place_kind").closest("form"));
  var young_scientist_block = $("fieldset.young_scientist", $("#work_place_kind").closest("form"));
  var personal_phone_block = $("fieldset.personal_phone", $("#work_place_kind").closest("form"));
  var chief_info_block = $("fieldset.chief_info", $("#work_place_kind").closest("form"));
  var chief_phone_block = $("fieldset.chief_phone", $("#work_place_kind").closest("form"));
  var address_block = $("fieldset.address", $("#work_place_kind").closest("form"));
  switch ($("#work_place_kind").val()) {
    case "student":
      student_block.show();
      young_scientist_block.hide();
      personal_phone_block.show();
      $("legend", personal_phone_block).text("Телефон");
      chief_info_block.show();
      chief_phone_block.show();
      address_block.show();
      $("legend", address_block).text("Адрес места учёбы");
      break;
    case "young_scientist":
      student_block.hide();
      young_scientist_block.show();
      personal_phone_block.show();
      $("legend", personal_phone_block).text("Рабочий телефон");
      chief_info_block.show();
      chief_phone_block.show();
      address_block.show();
      $("legend", address_block).text("Адрес места работы");
      break;
    default:
      student_block.hide();
      young_scientist_block.hide();
      personal_phone_block.hide();
      chief_info_block.hide();
      chief_phone_block.hide();
      address_block.hide();
      break;
  };

};

function work_place_academic_degree_change() {
  switch ($("#work_place_academic_degree").val()) {
    case "none":
      $("#work_place_academic_degree_science").attr("disabled", "disabled");
      $("#work_place_academic_degree_on").attr("disabled", "disabled");
      $("#work_place_academic_degree_on").next().hide();
      $("#work_place_academic_status").attr("disabled", "disabled");
      $("#work_place_academic_status_on").attr("disabled", "disabled");
      $("#work_place_academic_status_on").next().hide();
      break;
    case "candidate":
      $("#work_place_academic_degree_science").removeAttr("disabled");
      $("#work_place_academic_degree_on").removeAttr("disabled");
      $("#work_place_academic_degree_on").next().show();
      $("#work_place_academic_status").removeAttr("disabled");
      $("#work_place_academic_status_on").removeAttr("disabled");
      $("#work_place_academic_status_on").next().show();
      break;
    case "doctor":
      $("#work_place_academic_degree_science").removeAttr("disabled");
      $("#work_place_academic_degree_on").removeAttr("disabled");
      $("#work_place_academic_degree_on").next().show();
      $("#work_place_academic_status").removeAttr("disabled");
      $("#work_place_academic_status_on").removeAttr("disabled");
      $("#work_place_academic_status_on").next().show();
      break;
    default:
      $("#work_place_academic_degree_science").attr("disabled", "disabled");
      $("#work_place_academic_degree_on").attr("disabled", "disabled");
      $("#work_place_academic_degree_on").next().hide();
      $("#work_place_academic_status").attr("disabled", "disabled");
      $("#work_place_academic_status_on").attr("disabled", "disabled");
      $("#work_place_academic_status_on").next().hide();
      break;
  };
};

function work_place_manipulation() {
  if (!$("#work_place_kind").length) {
    return false;
  }
  work_place_status_change();
  $("#work_place_kind").change(function() {
    work_place_status_change();
    work_place_academic_degree_manipulation();
  });
  if ($("#work_place_kind").length) {
    $("#work_place_kind").closest("form").submit(function() {
      $("fieldset:hidden", $("#work_place_kind").closest("form")).remove();
    });
  };
  work_place_academic_degree_manipulation();
};

function work_place_academic_degree_manipulation() {
  if ($("#work_place_academic_degree").is(":visible")) {
    work_place_academic_degree_change();
    $("#work_place_academic_degree").change(function() {
      work_place_academic_degree_change();
    });
  }
};

function claim_documents_manipulation() {
  if (!$("#claim_no_documents").length) {
    return false;
  };
  $("#claim_no_documents").change(function() {
    if ($(this).is(":checked")) {
      $(".documents", $(this).closest("form")).hide();
    } else {
      $(".documents", $(this).closest("form")).show();
    };
  });
};

function accept_terms_toggle() {
  $("#accept_terms_toggle").click(function() {
    $("#accept_terms_text").dialog({
      width: 500,
      modal: true
    });
    return false;
  });
};

$(function() {

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

  $(".formtastic abbr, a[rel=tipsy], a.show_tipsy").tipsy({
    gravity: $.fn.tipsy.autoNS,
    html: true,
    live: true
  });

  work_place_manipulation();

  claim_documents_manipulation();

  accept_terms_toggle();

});

