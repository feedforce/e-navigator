# frozen_string_literal: true

interviewee1 = User.seed(:email) do |s|
  s.name = 'Yuma Shiraishi'
  s.email = 'shiraishi@test.com'
  s.password = 'password'
  s.gender = 'male'
  s.role = 'member'
end.first

interviewer1 = User.seed(:email) do |s|
  s.name = 'Yosuke Obata'
  s.email = 'obata@test.com'
  s.password = 'password'
  s.gender = 'male'
  s.role = 'interviewer'
end.first

Interview.seed do |s|
  s.user_id = interviewee1.id
  s.interviewer_id = interviewer1.id
  s.schedule = '2020/01/01 14:00'
  s.schedule_status = 'pending'
end

Interview.seed do |s|
  s.user_id = interviewee1.id
  s.interviewer_id = interviewer1.id
  s.schedule = '2020/01/02 14:00'
  s.schedule_status = 'fixed'
end

interviewer2 = User.seed(:email) do |s|
  s.name = 'Miki Miyazato'
  s.email = 'miyazato@test.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.gender = 'female'
  s.role = 'interviewer'
end.first

Interview.seed do |s|
  s.user_id = interviewee1.id
  s.interviewer_id = interviewer2.id
  s.schedule = '2020/01/03 14:00'
  s.schedule_status = 'pending'
end
