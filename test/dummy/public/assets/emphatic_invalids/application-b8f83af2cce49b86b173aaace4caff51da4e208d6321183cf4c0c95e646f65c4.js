(function() {
  var resetTabIndex,
    hasProp = {}.hasOwnProperty;

  resetTabIndex = function(form) {
    return $(form).find(":input").removeAttr("tabindex");
  };

  window.highlightInvalidFields = function(form, errorStr) {
    var btn, errors, fieldName, i, input, value;
    resetTabIndex(form);
    errors = $.parseJSON(errorStr);
    i = 1;
    for (fieldName in errors) {
      if (!hasProp.call(errors, fieldName)) continue;
      value = errors[fieldName];
      input = $(form).find("[name='" + fieldName + "'], [id='" + fieldName + "'], [name$='[" + fieldName + "]'], [data-ei-field-alias='" + fieldName + "']");
      $(input).attr("tabindex", i++);
      input.addClass("validation-error");
      $(input).tooltip({
        tooltipClass: "error-tooltips",
        position: {
          my: "left+15 center",
          at: "right center"
        }
      });
      $(input).attr("title", value);
      $(input).on('change', function() {
        return $(this).removeClass("validation-error");
      });
    }
    $(form).find(".validation-error").first().focus();
    btn = $(form).find("input[type='submit'], button[type='submit'], input[type='image']").first();
    return btn.attr("tabindex", i++);
  };

  $(document).on("turbolinks:load", function() {
    return $("body").on("ajax:error", "form[data-highlight-errors='true']", function(event, data, status, xhr) {
      return window.highlightInvalidFields(this, data.error().responseText);
    });
  });

}).call(this);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

;
