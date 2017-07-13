namespace :phones do
  desc 'Fixing incorrect name'
  task fix_names: :environment do
    puts "phones count: #{Phone.count}"
  end
end