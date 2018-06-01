class BaseDecorator < Draper::Decorator
  delegate_all

  class << self
    def header_objects
      model = eval(self.model_name.name.camelize)
      [
          model.human_attribute_name(:id),
          model.human_attribute_name(:name),
      ]
    end
    def body_objects
      [
          "id",
          "name",
      ]
    end
    def form_objects(f)
      [
          {label: :name, input: f.text_field(:name, class: "sizeL")}
      ]
    end
  end
end
