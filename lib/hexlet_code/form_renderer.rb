# frozen_string_literal: true

class HexletCode::FormRenderer
  def self.render(form_data, attributes)
    form_controls = []

    form_data[:inputs].each do |input|
      tag_class = Object.const_get("HexletCode::Tags::#{input[:as].capitalize}")
      form_controls << tag_class.build(input)
    end

    HexletCode::Tag.build('form', attributes) { form_controls.join }
  end
end
