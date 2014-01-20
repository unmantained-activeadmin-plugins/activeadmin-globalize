require 'globalize'
require 'activeadmin'

require 'active_admin/views/index_as_table'
require 'active_admin/globalize/engine'
require 'active_admin/globalize/form_builder_extension'
require 'active_admin/globalize/active_record_extension'
require 'active_admin/globalize/index_table_for_extension'

ActiveRecord::Base.send :extend, ActiveAdmin::Globalize::ActiveRecordExtension

ActiveAdmin::FormBuilder.send :include, ActiveAdmin::Globalize::FormBuilderExtension
ActiveAdmin::Views::IndexAsTable::IndexTableFor.send :include, ActiveAdmin::Globalize::IndexTableFor

