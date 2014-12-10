admin_email = 'site_admin@waverly.rideconnection.org'
unless User.exists?(email: admin_email)
  user_password = "Password 1"
  User.create! name: "Waverly Administrator",
    email: 'site_admin@waverly.rideconnection.org',
    password: user_password,
    password_confirmation: user_password,
    administrator: true
  puts "-- Created initial user: #{admin_email}\n   password: '#{user_password}'"
end

private_key = "xxxxxxxxxxxxxx"
unless Consumer.exists?(private_key: "xxxxxxxxxxxxxx")
  User.create! name: "Multnomah County",
    private_key: private_key
  puts "-- Created initial consumer: Multnomah County"
end
