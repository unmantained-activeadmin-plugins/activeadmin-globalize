module FriendlyId
  module Globalize3

    def self.included(model_class)
      model_class.friendly_id_config.instance_eval do
        self.class.send :include, Configuration
      end
      model_class.instance_eval do
        relation_class.send :include, FinderMethods
      end
    end

    module FinderMethods
      def find_one(id)
        return super if id.unfriendly_id?
        found = includes(:translations).
                where(translation_class.arel_table[:locale].in([I18n.locale, I18n.default_locale])).
                where(translation_class.arel_table[translation_class.friendly_id_config.query_field].eq(id)).first
        if found
          found.tap { |f| f.translations.reload }
        else
          find_one_without_friendly_id(id)
        end
      end
      protected :find_one
    end

    module Configuration
      def query_field
        model_class.translation_class.friendly_id_config.query_field
      end
    end

  end
end
