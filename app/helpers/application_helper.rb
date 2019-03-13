module ApplicationHelper
  
  def gender_check(x)
    if x == 0
      return "男性"
    elsif x == 1
      return "女性"
    end
  end
end
