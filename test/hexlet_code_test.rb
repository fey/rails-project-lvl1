# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_empty_form
    user = User.new name: 'rob'
    expected = read_fixture('empty_form')

    # rubocop:disable Lint/EmptyBlock
    actual = HexletCode.form_for user do |f|
    end
    # rubocop:enable Lint/EmptyBlock

    assert { actual == expected }
  end
end
