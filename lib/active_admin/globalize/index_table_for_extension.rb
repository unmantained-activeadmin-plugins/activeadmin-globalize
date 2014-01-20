require 'active_admin/views/components/status_tag'

module ActiveAdmin
  module Globalize
    module IndexTableFor
      def translation_status
        column I18n.t("active_admin.globalize.translations") do |obj|
          obj.translation_names.map do |t|
            '<span class="status_tag">%s</span>' % t
          end.join(" ").html_safe
        end
      end
    end
  end
end

