# frozen_string_literal: true

require 'test_helper'

module HexletCode
  class TagTest < Minitest::Test
    i_suck_and_my_tests_are_order_dependent!

    def test_br
      expected = '<br>'
      actual = HexletCode::Tag.build('br')

      assert { actual == expected }
    end

    def test_with_attrs
      assert { HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">' }
    end

    def test_with_block
      assert { HexletCode::Tag.build('label') { 'Email' } == '<label>Email</label>' }
    end

    def test_with_block_and_attrs
      actual = HexletCode::Tag.build('label', for: 'email') { 'Email' }

      assert { actual == '<label for="email">Email</label>' }
    end

    def test_paired
      actual = HexletCode::Tag.build('div')
      assert { actual == '<div></div>' }
    end
  end
end
