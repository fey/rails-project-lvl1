# frozen_string_literal: true

class HexletCode::Tags::Text
  def self.build(tag_data)
    value = tag_data[:value]

    attrs = {
      name: tag_data[:name],
      cols: 20,
      rows: 40
    }.merge(tag_data.except(:value))

    HexletCode::Tag.build('textarea', attrs) { value }
  end
end
