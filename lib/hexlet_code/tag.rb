# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attributes = {})
      singled_tags = %w[img br input]
      builded_attributes = attributes.compact.map do |key, value|
        " #{key}=\"#{value}\""
      end.join

      return "<#{name}#{builded_attributes}>" if singled_tags.include? name
      return "<#{name}#{builded_attributes}>#{yield}</#{name}>" if block_given?

      "<#{name}#{builded_attributes}></#{name}>"
    end
  end
end
