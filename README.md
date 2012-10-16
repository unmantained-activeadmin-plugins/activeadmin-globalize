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
form do |f|
  # ...
  f.translated_inputs "Translated fields" do |t|
    t.input :locale, as: :hidden
    t.input :title
    t.input :content
  end
  # ...
end
```
