module ApplicationHelper

  # 日時の形式を変更
  def simple_time(time)
    time.strftime("%Y年%m月%d日 %H時%M分 ")
  end
end
