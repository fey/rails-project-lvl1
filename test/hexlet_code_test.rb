# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

class HexletCodeTest < Minitest::Test
  def setup
    @user = User.new name: 'rob'
  end

  def test_empty_form
    expected = read_fixture('empty_form')

    # rubocop:disable Lint/EmptyBlock
    actual = HexletCode.form_for @user do |f|
    end
    # rubocop:enable Lint/EmptyBlock

    assert { actual == expected }
  end
end
