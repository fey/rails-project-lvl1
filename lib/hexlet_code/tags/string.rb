# frozen_string_literal: true

class HexletCode::Tags::String
  def self.build(name, value, attrs = {})
    HexletCode::Tag.build('input', name: name, type: 'text', value: value, **attrs)
  end
end
