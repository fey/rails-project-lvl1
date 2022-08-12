# frozen_string_literal: true

module HexletCode
  module Tags
    class String
      def self.build(name, value, attrs = {})
        HexletCode::Tag.build('input', name: name, type: 'text', value: value, **attrs)
      end
    end
  end
end
