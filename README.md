# Emphatic Invalids
Utilizes Rails server-side model validations to display client-side error messages for Ajax form submissions.

------

*screenshot of invalid form submission*
![Example Screenshot](/readme-assets/invalid-submission-screenshot "screenshot of invalid form submission.")

------


## Features

 * After an invalid Ajax form submission any fields that failed Rails model validation will be highlighted.
 * Rails validation error message are displayed as a jQuery UI tooltip whenever an invalid field has focus or is hovered over. This way when there are several invalid fields the messages aren't all displayed at once.
 * Adjusts the form fields' tab index***** so the user can easily tab from one invalid field to the next and finally to a submit button.
 * Once an invalid field's value has been changed the highlight is removed from it.
 * Also works with deeply nested attributes



***** *For the best field navigation experience the model validations should be declared in the same order that the fields appear in the form. This includes nested attributes so that their associations and validations are declared in the same order of the form also. Compare views/registrations/_form.html.haml with the models in the test/dummy application for an example*



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emphatic_invalids'
```

And then execute:
```bash
$ bundle
```

In one of your javascript files require `emphatic_invalids/script.coffee`



## Usage

#### Javascript
Register your forms by adding the following to one of your project's javascript/coffeescript:
```coffeescript
$(document).ready( ->
  window.EmphaticInvalids.registerForms()
)

# or

# $(document).on("turbolinks:load", ->
#   window.EmphaticInvalids.registerForms()
#  )
```
The `registerForms()` method takes an optional parameter allowing you to select which `<form>` elements in your application should utilize the gem (the default value is `"form[data-remote=true]"`)

_Example:_

If you don't want to register *all* remote forms you can always add you own attribute to the desired forms: 

```HTML
<form data-remote="true" data-highlight-errors="true">
<!-- ... -->
</form>
```
and just specify that selector in the register call:
```coffeescript
$(document).ready( ->
  window.EmphaticInvalids.registerForms("form[data-highlight-errors=true"])
)
```

#### Controllers
Inside each appropriate controller action, which is usually just *update* and *create* you will need to call the `emphasize_invalids` method like this:
```ruby
def update
  # ...
  respond_to do |format|
    if @post.save
      # ...
      format.js { render :success } #successfully saved...do whatever's appropriate here
    else
      emphasize_invalids(@post, format)
    end
  end
end
```

### Optional
_Note: All the following options are used in the test/dummy application. See the views/registrations/_form.html.haml partial_

By default the input element ([view the particlulars](#markdown-header-particulars)) itself will be highlighted, but that can be overwritten at the form or field level with data attribute _data-ei-highlight-element_ ******
```HTML
<input type="text" name="author" data-ei-highlight-element=".field" />
```

By default the tooltip will be applied to the matching input element itself, but that can be overwritten at the form or field level with a data attribute _data-ei-tooltip-element_ ****** 
```HTML
<input type="radio" name="choice1" data-ei-tooltip-element="fieldset.rb-group" />
```

**\*\*** *The value of the data-ei-highlight-element attribute should be a selector that will be evaluated in the context of the invalid input's closest matching ancestor*

By default the tooltip's position will be centered vertically and 15 pixels to the right of it's target element. The position can be overridden at the form or element level by setting a data attribute _data-ei-tooltip-position_ on the target element. Make sure if you have overridden the target element that the attribute is placed on that specific element. The value needs to be a valid JSON string in the format of the `options` argument expected by the [jQuery position method](https://api.jqueryui.com/position/).
```HTML
<form data-remote="true" data-ei-tooltip-position='{"my": "left+2 center", "at": "right center"}'>
  <!-- ... -->
</form>
```

#### Styling
The styling of the highlighted fields and the tooltips can be adjusted by defining the CSS class `.highlight-error` and/or `.error-tooltips` anywhere _after_ `require emphatic_invalids/style.css`


## Particulars
Based on each validation error's key the messages are mapped to their corresponding form input elements when an element's:

 * name attribute equals the key exactly
 * id attribute equals the key exactly
 * name attribute ends in "[key]" or "[key]\[\]"
 * data-ei-field-alias attribute equals the key


When the actual form element (something like a Rails date_select) doesn't match the validation field's identifier, an element can be specified using the data attribute _data-ei-field-alias_, which should be set to the validation error key.
```haml
%div.field{"data-ei-field-alias" => "date_of_birth"}
  = form.date_select :date_of_birth, id: :registration_date_of_birth
```

_If you aren't getting the results you expect it may be helpful to view the actual validation error data being sent by the gem. Add a hidden input element to your form with `id="log-invalids"` and the data will be logged to your browser's javascript console._


## Contributing

Just going live with this. Please send any comments or suggestions.

## TODO:
 * Cleaner error to element mapping

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
