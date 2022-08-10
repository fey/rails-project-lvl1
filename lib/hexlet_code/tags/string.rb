# frozen_string_literal: true

class HexletCode::Tags::String
  def self.build(tag_data)
    value = tag_data[:value]
    HexletCode::Tag.build('input', name: tag_data[:name], type: 'text', value: value)
  end
end
