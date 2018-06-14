class InterviewDecorator < Draper::Decorator
  delegate_all

  def show_date
    return start_date.strftime("%Y年%m月%d日 %H時%M分〜")
  end


  class << self
    def header_objects
      model = eval(self.model_name.name.camelize)
      [
          model.human_attribute_name(:id),
          model.human_attribute_name(:start_date),
          model.human_attribute_name(:status),
      ]
    end

    def body_objects
      [
          "id",
          "show_date",
          "status_i18n",
      ]
    end
  end
end
