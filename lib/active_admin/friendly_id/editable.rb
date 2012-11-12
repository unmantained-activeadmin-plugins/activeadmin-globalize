module FriendlyId
  module Editable
    def should_generate_new_friendly_id?
      slug_value = send(friendly_id_config.slug_column)
      slug_value.blank?
    end
  end
end
