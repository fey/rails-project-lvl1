# frozen_string_literal: true

class HexletCode::Tags::String
  def self.build(tag_data)
    value = tag_data[:value]

    attrs = { name: tag_data[:name], type: 'text', value: value}.compact

    HexletCode::Tag.build('input', attrs)
  end
end
