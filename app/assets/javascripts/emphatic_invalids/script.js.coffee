#= require jquery
#= require jquery-ui/tooltip
#= require jquery_ujs


resetTabIndex = (form) ->
  # clear all (including valid fields) tab indexes
  $(form).find(":input").removeAttr( "tabindex" )

window.highlightInvalidFields = (form, errorStr) ->
  resetTabIndex(form)
  errors = $.parseJSON(errorStr)
  i = 1
  for own fieldName, value of errors
    
    # name and/or id attribute equals exactly "fieldName"
    # name attribute ends in "[fieldName]", or 
    # data-ei-field-alias attribute equals fieldName

    input = $(form).find("[name='"+fieldName+"'], [id='"+fieldName+"'], [name$='["+fieldName+"]'], [data-ei-field-alias='"+fieldName+"']")
    
    $(input).attr("tabindex", i++) #set tab order for just invalid fields
    
    input.addClass("validation-error")
    
    $(input).tooltip(
      tooltipClass: "error-tooltips"
      position:
        my: "left+15 center", at: "right center"
    )
   
    $(input).attr("title", value) #set title so tooltip displays it
   
    $(input).on('change', ->
      $(this).removeClass("validation-error")
    )

  $(form).find(".validation-error").first().focus() #set focus to the first highlighted field
  
  btn = $(form).find("input[type='submit'], button[type='submit'], input[type='image']").first()
  btn.attr("tabindex", i++) #submit button gets next tab order after all invalid fields

$(document).ready( ->
  $("body").on("ajax:error", "form[data-highlight-errors='true']", (event, data, status, xhr) ->
    window.highlightInvalidFields(this, data.error().responseText)
  )
)