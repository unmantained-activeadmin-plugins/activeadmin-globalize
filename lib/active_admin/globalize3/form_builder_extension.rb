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

        inputs name do
          template.content_tag(:ul, class: "locales-tabs") do
            object.translations.map do |translation|
              locale = translation.locale
              template.content_tag(:li) do
                template.content_tag(:a, I18n.t(:"active_admin.globalize3.language.#{locale}"), href:"#locale-#{locale}", data: { behaviour: "tab", tab_scope: "globalize" })
              end
            end.join.html_safe
          end <<
          template.content_tag(:div, class:"locales-contents") do
            semantic_fields_for(:translations) do |t|
              template.content_tag(:div, class: "locale", id:"locale-#{t.object.locale}") do
                t.inputs do
                  t.input :locale, as: :hidden
                  yield(t)
                end
              end
            end
          end
        end
      end

      module ClassMethods
      end
    end
  end
end
