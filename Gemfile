source "http://rubygems.org"

# Declare your gem's dependencies in simple_form_fancy_uploads.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

if Dir.exists?(File.expand_path('~/code/gems'))
  gem 'railsyard-backend'               , path: File.expand_path('~/code/gems/railsyard-backend')
else
  gem 'railsyard-backend'               , git: 'git://github.com/cantierecreativo/railsyard-backend.git', branch: 'develop'
end

group :development, :test do
  gem 'simplecov', require: false
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.8.1'
  gem 'webrat'
  gem 'friendly_id'
end

