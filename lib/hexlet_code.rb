# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  class Error < StandardError; end

  def self.form_for(_model, attributes = { url: '#', method: 'post' })
    default_attributes = {
      action: attributes[:url],
      method: attributes[:method]
    }

    form_attributes = default_attributes.merge attributes.except(:url)
    Tag.build('form', form_attributes)
  end
end
