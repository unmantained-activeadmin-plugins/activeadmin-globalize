# ActiveAdmin::Globalize3

Makes it easy to translate your resource fields.

## Installation

```ruby
gem "activeadmin-globalize3"
```
## Your model

```ruby
active_admin_translates :title, :description do
  validates_presence_of :title
end
```
## Editor configuration

```ruby

index do
  # ...
  translation_status
  # ...
  default_actions
end

form do |f|
  # ...
  f.translated_inputs "Translated fields" do |t|
    t.input :title
    t.input :content
  end
  # ...
end
```
