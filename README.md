# EmphaticInvalids
Utilizes Rails server-side model validations to display client-side error messages for Ajax form submissions without actually performing any client-side validation.




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
Register your forms by adding the following to one of your project's javascripts (in this example coffeescript):
```coffeescript
$(document).ready( ->
  window.EmphaticInvalids.registerForms()
)

# or

# $(document).on("turbolinks:load", ->
#   window.EmphaticInvalids.registerForms()
#  )
```
The `registerForms()` method takes an optional parameter specifying the selector for which elements should be registered to display errors (default value is `"form[data-remote=true]"`)


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
      format.js { render :success }
    else
      emphasize_invalids(@post, format)
    end
  end
end
```



##Features

 * After an invalid Ajax form submission it highlights fields that failed Rails model validation
 * Displays Rails validation error message as a jQuery UI tooltip whenever an invalid field has focus or is hovered over. This way when there are several invalid fields the messages aren't all displayed at once.
 * Adjusts the form fields' tab index***** so the user can easily tab from one invalid field to the next and finally to a submit button
 * Once an invalid field's value has been changed the highlight is removed from it
 * By default the [input element](#partic) itself will be highlighted, but that can be overwritten at the form or field level with data attribute _data-ei-highlight-element_ ******
```HTML
<input type="text" name="author" data-ei-highlight-element=".field" />
```
 * By default the tooltip will be applied to the matching input element itself, but that can be overwritten at the form or field level with a data attribute _data-ei-tooltip-element_ ****** 
```HTML
<input type="radio" name="choice1" data-ei-tooltip-element="fieldset.rb-group" />
```



***** *For the best field navigation experience the model validations should be defined in the same order that the fields appear in the form*

**\*\*** *The value of the data-ei-highlight-element attribute should be a selector that will be evaluated in the context of the invalid input's closest matching ancestor element*



##Particulars <a id="partic"></a>
Based on each validation error's key the messages are mapped to their corresponding form input elements when an element's:

 * name attribute equals the key exactly
 * id attribute equals the key exactly
 * name attribute ends in "[key]" or "[key]\[\]"
 * data-ei-field-alias attribute equals the key


When the actual form element (something like a Rails date_select) doesn't match the validation field's identifier, an element can be specified using the data attribute _data-ei-field-alias_, which should specify the name or id of the element.
```haml
%div.field{"data-ei-field-alias" => "date_of_birth"}
  = form.date_select :date_of_birth, id: :registration_date_of_birth
```

If you aren't getting the results you expect it may help to view the actual error data being sent by the gem. Add a hidden element to your form with `id="log-invalids"` and the EmphaticInvalids data will be logged to your browser's javascript console.


## Contributing

Contribution directions go here.

##TODO:
 * Better error to element mapping
 * Allow errors for nested attributes 


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
