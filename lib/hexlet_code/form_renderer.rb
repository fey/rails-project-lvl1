# frozen_string_literal: true

class HexletCode::FormRenderer
  def self.render(form_data, url, method)
    form_controls = []

    form_data[:inputs].each do |input|
      label = HexletCode::Tag.build('label', for: input[:name]) { input[:name].capitalize }
      form_controls << label

      tag_class = Object.const_get("HexletCode::Tags::#{input[:as].capitalize}")
      form_controls << tag_class.build(input)
    end

    if form_data.fetch(:submit)
      submit_button = HexletCode::Tag.build(
        'input',
        name: 'commit',
        type: 'submit',
        value: form_data.dig(:submit, :value)
      )
      form_controls.append submit_button
    end

    HexletCode::Tag.build('form', action: url, method: method) { form_controls.join }
  end
end
