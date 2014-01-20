module ActiveAdmin
  module Globalize
    class Engine < ::Rails::Engine
      initializer "Active Admin precompile hook", group: :assets do |app|
        app.config.assets.precompile += [
          "active_admin/active_admin_globalize.css",
          "active_admin/active_admin_globalize.js"
        ]
      end

      initializer "add assets" do
        ActiveAdmin.application.register_stylesheet "active_admin/active_admin_globalize.css", :media => :screen
        ActiveAdmin.application.register_javascript "active_admin/active_admin_globalize.js"
      end

    end
  end
end

