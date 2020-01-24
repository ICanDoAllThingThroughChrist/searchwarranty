namespace :searchwarranty do
  desc "Import srs."
  task import_sr: :environment do
    require 'open-uri'
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    thing1 = web1.split(/\n/)
    things2 = web2.split(/\n/)
    # TO DO: "create Sr object from things  array while skipping first index of array"
  #   "desc "Import users." 
  # task :import_users => :environment do
  #   File.open("users.txt", "r", '\r').each do |line|
  #     id, name, age, email = line.strip.split(',')
  #     u = User.new(:id => id, :name => name, :age => age, :email => email)
  #     u.save
  #   end
  # end"
  end

end
