# frozen_string_literal: true

class HexletCode::FormBuilder
  attr_reader :form

  def initialize(model)
    @model = model
    @form = {
      inputs: [],
      submit: nil
    }
  end

  def input(name, attrs = {})
    value = @model.public_send(name)

    @form[:inputs] << {
      name: name,
      as: attrs.fetch(:as, :string),
      value: value,
      attrs: attrs.except(:as)
    }
  end

  def submit(value = 'Save')
    @form[:submit] = {
      value: value
    }
  end
end
