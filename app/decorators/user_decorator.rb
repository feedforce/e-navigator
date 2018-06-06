class UserDecorator < Draper::Decorator
  delegate_all

  def birthday_human
    return "不明" unless birthday
    return "#{birthday} (#{age}歳)"
  end

  def age
    return "-" unless birthday
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  class << self
    def header_objects
      model = eval(self.model_name.name.camelize)
      [
          model.human_attribute_name(:id),
          model.human_attribute_name(:name),
          model.human_attribute_name(:sex),
          model.human_attribute_name(:birthday),
          model.human_attribute_name(:school),
          model.human_attribute_name(:email),
      ]
    end

    def body_objects
      [
          "id",
          "name",
          "sex_i18n",
          "birthday_human",
          "school",
          "email",
      ]
    end

    def bd_count() 50 ; end

  end
end
