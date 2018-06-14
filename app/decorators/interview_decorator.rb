class InterviewDecorator < Draper::Decorator
  delegate_all

  class << self
    def header_objects
      model = eval(self.model_name.name.camelize)
      [
          model.human_attribute_name(:id),
          model.human_attribute_name(:start_date),
          model.human_attribute_name(:end_date),
          model.human_attribute_name(:status),
      ]
    end

    def body_objects
      [
          "id",
          "start_date",
          "end_date",
          "status_i18n",
      ]
    end
  end
end
