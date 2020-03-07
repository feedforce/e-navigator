# frozen_string_literal: true

interviewees = User.seed(:email) do |s|
  s.name = 'Yuma Shiraishi'
  s.email = 'shiraishi@test.com'
  s.password = 'password'
  s.gender = 'male'
  s.role = 'member'
end

interviewers = User.seed(:email) do |s|
  s.name = 'Yosuke Obata'
  s.email = 'obata@test.com'
  s.password = 'password'
  s.gender = 'male'
  s.role = 'interviewer'
end

Interview.seed do |s|
  s.user_id = interviewees.first.id
  s.interviewer_id = interviewers.first.id
  s.schedule = '2020/01/01 14:00'
  s.schedule_status = 'pending'
end

Interview.seed do |s|
  s.user_id = interviewees.first.id
  s.interviewer_id = interviewers.first.id
  s.schedule = '2020/01/02 14:00'
  s.schedule_status = 'fixed'
end

interviewers = User.seed(:email) do |s|
  s.name = 'Miki Miyazato'
  s.email = 'miyazato@test.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.gender = 'female'
  s.role = 'interviewer'
end

Interview.seed do |s|
  s.user_id = interviewees.first.id
  s.interviewer_id = interviewers.first.id
  s.schedule = '2020/01/03 14:00'
  s.schedule_status = 'pending'
end
