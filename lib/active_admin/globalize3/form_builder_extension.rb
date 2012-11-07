module ActiveAdmin
  module Globalize3
    module FormBuilderExtension
      extend ActiveSupport::Concern

      def translated_inputs(name = "Translations", &block)
        I18n.available_locales.each do |locale|
          translation = object.translations.find do |translation|
            translation.locale.to_sym == locale.to_sym
          end
          object.translations.build(locale: locale) unless translation.present?
        end

        form_buffers.last << template.content_tag(:div, class: "activeadmin-translations") do
          template.content_tag(:ul, class: "available-locales") do
            I18n.available_locales.sort.map do |locale|
              template.content_tag(:li) do
                template.content_tag(:a, I18n.t(:"active_admin.globalize3.language.#{locale}"), href:".locale-#{locale}")
              end
            end.join.html_safe
          end <<
          object.translations.map do |translation|
            fields = proc do |form|
              form.input(:locale, as: :hidden)
              block.call(form)
            end
            inputs_for_nested_attributes(
              for: [:translations, translation ],
              class: "inputs locale locale-#{translation.locale}",
              &fields
            )
          end.join.html_safe
        end
      end

      module ClassMethods
      end
    end
  end
end
