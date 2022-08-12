# frozen_string_literal: true

class HexletCode::FormRenderer
  def self.render(form, url, method)
    form_controls = []

    form[:inputs].each do |input|
      name, value, type, attrs = input.values_at(:name, :value, :type, :attrs)
      label = HexletCode::Tag.build('label', for: name) { name.capitalize }

      type = input.fetch(:type)
      tag_class = Object.const_get("HexletCode::Tags::#{type.capitalize}")

      form_controls << label

      form_controls << tag_class.build(name, value, attrs)
    end

    if form.fetch(:submit)
      submit_button = HexletCode::Tag.build(
        'input',
        name: 'commit',
        type: 'submit',
        value: form.dig(:submit, :value)
      )
      form_controls.append submit_button
    end

    HexletCode::Tag.build('form', action: url, method: method) { form_controls.join }
  end
end
