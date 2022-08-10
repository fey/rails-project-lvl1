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

  def test_form_with_submit
    user = User.new job: 'hexlet'
    expected = read_fixture('with_submit')

    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
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
