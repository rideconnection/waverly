admin_email = 'site_admin@waverly.rideconnection.org'
unless User.exists?(email: admin_email)
  user_password = "Password 1"
  User.create email: 'site_admin@waverly.rideconnection.org',
    password: user_password,
    password_confirmation: user_password,
    administrator: true
  puts "-- Created initial user: #{admin_email}\n   password: '#{user_password}'"
end
