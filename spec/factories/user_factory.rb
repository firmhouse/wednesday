Factory.define :user do |u|
  u.email "user@example.com"
  u.password "password"
  u.password_confirmation { |u| u.password }
end