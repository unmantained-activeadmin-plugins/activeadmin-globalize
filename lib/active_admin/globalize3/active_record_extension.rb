module ActiveAdmin::Globalize3
  module ActiveRecordExtension

    def active_admin_translates(*args, &block)
      translates(*args)
      args.extract_options!

      if block
        translation_class.instance_eval &block
      end
      translation_class.attr_accessible :locale
      translation_class.attr_accessible *args

      attr_accessible :translations_attributes
      accepts_nested_attributes_for :translations, allow_destroy: true
    end

  end
end

