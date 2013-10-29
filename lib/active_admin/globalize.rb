require 'globalize'
require 'activeadmin'

require 'active_admin/views/index_as_table'
require 'active_admin/globalize3/engine'
require 'active_admin/globalize3/form_builder_extension'
require 'active_admin/globalize3/active_record_extension'
require 'active_admin/globalize3/index_table_for_extension'

ActiveRecord::Base.send :extend, ActiveAdmin::Globalize3::ActiveRecordExtension

ActiveAdmin::FormBuilder.send :include, ActiveAdmin::Globalize3::FormBuilderExtension
ActiveAdmin::Views::IndexAsTable::IndexTableFor.send :include, ActiveAdmin::Globalize3::IndexTableFor
