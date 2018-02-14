module UsersHelper

  def calc_age(user)
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - user.birthday.strftime(date_format).to_i) / 10000
  end
end
