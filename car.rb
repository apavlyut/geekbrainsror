require_relative './lib/tesla_car'
require_relative './lib/tesla_car_test'

m3_params = [350, 2, 3]
#
test_tesla = TestTeslaCar.new(*m3_params)
#
test_tesla.test_correct_car_release(350)

puts "ENV['HEELO_GEEKS']: #{ENV['HEELO_GEEKS']}"

# # asdsad
# model3 = TeslaCar.new()
# modelS = TeslaCar.new()
# modelX = TeslaCar.new()
