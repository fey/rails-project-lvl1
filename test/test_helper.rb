# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest-power_assert'
require 'simplecov'
SimpleCov.start

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

User = Struct.new(:name, :job, :gender, keyword_init: true)

module Minitest
  class Test
    def read_fixture(name)
      fixture_path = File.expand_path("#{__dir__}/fixtures/#{name}.html")

      File.read(fixture_path).strip
    end
  end
end
