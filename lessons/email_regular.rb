email = 'install.vv@gmail.com'

if email =~ /\A.+@.+\..+\z/i
  puts 'Valid email!'
else
  puts 'Thats not an email'
end