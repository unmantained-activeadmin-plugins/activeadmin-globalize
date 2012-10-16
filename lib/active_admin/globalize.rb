require 'globalize3'
require 'active_admin/globalize3/engine'
require 'active_admin/globalize3/form_builder_extension'
require 'active_admin/globalize3/active_record_extension'

ActiveRecord::Base.send :extend, ActiveAdmin::Globalize3::ActiveRecordExtension
ActiveAdmin::FormBuilder.send :include, ActiveAdmin::Globalize3::FormBuilderExtension
