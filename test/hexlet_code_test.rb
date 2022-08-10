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

  def test_form_with_fields
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    expected = read_fixture('form_with_fields')

    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal actual, expected
  end

  def test_with_undefined_model_method
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_raises NoMethodError do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end
    end
  end
end
