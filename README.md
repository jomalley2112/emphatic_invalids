# EmphaticInvalids
Bridges the gap between Rails server-side model validations and client-side error message presentation for AJAX form submissions.

## Usage
 * To specify that a remote form should use the gem add the _data-highlight-errors_ attribute to it and set it to true:
```HTML
<form data-remote="true" data-highlight-errors="true">
<!-- ... -->
</form>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'emphatic_invalids'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install emphatic_invalids
```

##Features

 * Highlights any fields that failed Rails model validation
 * Displays Rails validation error message as a jQuery UI tooltip whenever an invalid field has focus or is hovered over
 * Adjusts the form's tab index so the user can easily tab from one invalid field to the next and finally to a submit button*
 * Once an invalid field's value has been changed the "emphasis" is removed
 * By default the input element itself will be highlighted, but that can be overwritten at the form or field level with data attribute _data-ei-highlight-element_ * 
```HTML
<input type="text" name="author" data-ei-highlight-element=".field" />
```
 * By default the tooltip will be applied to the input element itself, but that can be overwritten at the form or field level with a data attribute _data-ei-tooltip-element_ ** 
```HTML
<input type="radio" name="choice1" data-ei-tooltip-element="fieldset.rb-group" />
```
 * When the actual input elements don't match the validation field's identifiers (e.g. Rails date controls), an element can be specified using the data attribute _data-ei-field-alias_, which should specify the name or id of the element.
```haml
%div.field{"data-ei-field-alias" => "date_of_birth"}
  = form.date_select :date_of_birth, id: :registration_date_of_birth
```

*For the best user experience model validations should be defined in the same order as the fields appear in the form

\*\*The value of the attribute should be a selector that will be evaluated in the context of the invalid input's closest matching ancestor element.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
