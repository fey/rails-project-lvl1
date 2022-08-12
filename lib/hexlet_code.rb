# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support'
require 'active_support/core_ext'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :FormRenderer, 'hexlet_code/form_renderer.rb'
  autoload :Tags, 'hexlet_code/tags.rb'
  class Error < StandardError; end

  def self.form_for(model, url: '#', method: 'post')
    pp "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
    form_builder = FormBuilder.new(model)
    yield form_builder
    FormRenderer.render(form_builder.form, url, method)
  end
end
