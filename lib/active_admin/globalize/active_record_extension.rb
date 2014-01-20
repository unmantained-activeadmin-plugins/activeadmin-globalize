module ActiveAdmin::Globalize
  module ActiveRecordExtension

    module Methods
      def translation_names
        self.translations.map(&:locale).map do |locale|
          I18n.t("active_admin.globalize.language.#{locale}")
        end.uniq.sort
      end
    end

    def active_admin_translates(*args, &block)
      translates(*args.dup)
      args.extract_options!

      if block
        translation_class.instance_eval &block
      end

      accepts_nested_attributes_for :translations, allow_destroy: true

      include Methods
    end

  end
end

