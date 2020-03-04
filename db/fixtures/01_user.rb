# frozen_string_literal: true

User.seed do |s|
  s.id = 1
  s.name = 'Yuma Shiraishi'
  s.email = 'shiraishi@test.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.gender = 'male'
  s.role = 'member'
end

User.seed do |s|
  s.id = 2
  s.name = 'Yosuke Obata'
  s.email = 'obata@test.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.gender = 'male'
  s.role = 'interviewer'
end

User.seed do |s|
  s.id = 3
  s.name = 'Miki Miyazato'
  s.email = 'miyazato@test.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.gender = 'female'
  s.role = 'interviewer'
end
