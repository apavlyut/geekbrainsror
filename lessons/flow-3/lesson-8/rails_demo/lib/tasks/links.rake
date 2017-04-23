desc 'Clearing all links from db'
task clear_links: :environment do
  puts "Clearing links"
  Link.destroy_all
  puts "Cleared!"
end
