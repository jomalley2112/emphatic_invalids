#= require jquery
#= require jquery-ui/tooltip
#= require jquery_ujs

parentOrSelf = (input, selector) ->
  if $(input).closest(selector).length then $(input).closest(selector) else input

mostTargetedElement = (input, attr) ->
  selector = $(input).attr(attr) ? $(input.form).attr(attr)
  element = parentOrSelf(input, selector)

class InvalidField
  constructor: (@input, @value) ->
    @input.addClass("invalid-field")
    highlightElement = mostTargetedElement(@input, "data-ei-highlight-element")
    highlightElement.addClass("highlight-error")
    tooltipElement = mostTargetedElement(@input, "data-ei-tooltip-element")   
    $(tooltipElement).tooltip(
      tooltipClass: "error-tooltips"
      position:
        my: "left+15 center", at: "right center"
    )
    $(tooltipElement).attr("title", @value) #set title so tooltip displays it

resetTabIndex = (form) ->
  # clear all (including valid fields) tab indexes
  $(form).find(":input").removeAttr( "tabindex" )

highlightInvalidFields = (form, data) ->
  resetTabIndex(form)
  errorStr = data.error().responseText
  console.log("EmphaticInvalids: "+errorStr) if !!$(form).find("#log-invalids").length > 0
  errors = $.parseJSON(errorStr)
  i = 1

  for own fieldName, value of errors
    
    # name and/or id attribute equals exactly "fieldName"
    # name attribute ends in "[fieldName]" or "[fieldName][]", or 
    # data-ei-field-alias attribute equals fieldName
    fieldName = fieldName.replace(".", "_attributes][") #if it contains dots it is a nested attribute
    input = $(form).find("[name='"+fieldName+"'], [id='"+fieldName+"'], [name$='["+fieldName+"]'], [name$='["+fieldName+"][]'], [data-ei-field-alias='"+fieldName+"']").not(":hidden")

    $(input).attr("tabindex", i++) #set tab order for just invalid fields
    
    invalidField = new InvalidField input, value

    $(input).on('change', ->
      highlightedElement = mostTargetedElement(this, "data-ei-highlight-element")
      tooltipElement = mostTargetedElement(this, "data-ei-tooltip-element")
      $(highlightedElement).removeClass("highlight-error")
      $(tooltipElement).tooltip("destroy") if !!$(tooltipElement).data("ui-tooltip")
      $(tooltipElement).removeAttr("title")
      $(this).removeClass("invalid-field")
    )

  $(form).find(".invalid-field").first().focus() #set focus to the first highlighted field
  
  btn = $(form).find("input[type='submit'], button[type='submit'], input[type='image']").first()
  btn.attr("tabindex", i++) #submit button gets next tab order after all invalid fields

window.EmphaticInvalids = {}
window.EmphaticInvalids.registerForms = (selector="form[data-remote=true]") ->
  $("body").on("ajax:error", selector, (event, data, status, xhr) ->
    highlightInvalidFields(this, data)
  )