#= require jquery
#= require jquery-ui/tooltip
#= require jquery_ujs


resetTabIndex = (form) ->
  # clear all (including valid fields) tab indexes
  $(form).find(":input").removeAttr( "tabindex" )

window.highlightInvalidFields = (form, data) ->
  resetTabIndex(form)
  errorStr = data.error().responseText
  errors = $.parseJSON(errorStr)
  
  ttElSelector = form.dataset.eiTooltipElement #could be undefined
  hilightElSelector = form.dataset.eiHighlightElement

  i = 1
  for own fieldName, value of errors
    
    # name and/or id attribute equals exactly "fieldName"
    # name attribute ends in "[fieldName]", or 
    # data-ei-field-alias attribute equals fieldName

    input = $(form).find("[name='"+fieldName+"'], [id='"+fieldName+"'], [name$='["+fieldName+"]'], [data-ei-field-alias='"+fieldName+"']")
    
    $(input).attr("tabindex", i++) #set tab order for just invalid fields
    
    input.addClass("invalid-field")

    hilightElSelector = $(input).attr("data-ei-highlight-element") ? hilightElSelector
    highlightElement = if $(input).closest(hilightElSelector).length then $(input).closest(hilightElSelector) else input
    highlightElement.addClass("highlight-error") #element other than input if some data-attribute passed

    ttElSelector = $(input).attr("data-ei-tooltip-element") ? ttElSelector #override form-level if set on input
    #closest matching parent to the input or the input element itself
    tooltipElement = if $(input).closest(ttElSelector).length then $(input).closest(ttElSelector) else input 
    $(tooltipElement).tooltip(
      tooltipClass: "error-tooltips"
      position:
        my: "left+15 center", at: "right center"
    )
    $(tooltipElement).attr("title", value) #set title so tooltip displays it
   
    $(input).on('change', ->
      $(this).removeClass("invalid-field")
      debugger #The problem with the next line is the variable keeps changing in each loop
      $(highlightElement).removeClass("highlight-error")
    )

  #TODO: Possibly build up an array of objects in the loop and then grab the first element
  $(form).find(".invalid-field").first().focus() #set focus to the first highlighted field
  
  btn = $(form).find("input[type='submit'], button[type='submit'], input[type='image']").first()
  btn.attr("tabindex", i++) #submit button gets next tab order after all invalid fields

$(document).ready( ->
  $("body").on("ajax:error", "form[data-highlight-errors='true']", (event, data, status, xhr) ->
    window.highlightInvalidFields(this, data)
  )
)