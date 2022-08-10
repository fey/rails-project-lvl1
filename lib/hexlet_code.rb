# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :FormRenderer, 'hexlet_code/form_renderer.rb'
  autoload :Tags, 'hexlet_code/tags.rb'
  class Error < StandardError; end

  def self.form_for(model, attributes = { url: '#', method: 'post' })
    default_attributes = {
      action: attributes[:url],
      method: attributes[:method]
    }

    form_builder = FormBuilder.new(model)

    yield form_builder

    form_attributes = default_attributes.merge attributes.except(:url)

    FormRenderer.render(form_builder.form, form_attributes)
  end
end
