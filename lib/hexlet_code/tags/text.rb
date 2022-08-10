# frozen_string_literal: true

class HexletCode::Tags::Text
  def self.build(tag_data)
    value = tag_data[:value]
    HexletCode::Tag.build('textarea', name: tag_data[:name], cols: 20, rows: 40) { value }
  end
end
