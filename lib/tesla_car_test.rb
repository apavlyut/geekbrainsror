class TestTeslaCar
  def initialize(*args)
    @test_tesla_car = TeslaCar.new(*args)
  end

  def test_correct_car_release(platform)
    test_result = @test_tesla_car.release_car!
    expected_result = "your car platform is #{platform}"
    if test_result == expected_result
      puts "test passed!"
    else
      puts "test broken! \nexpected #{expected_result} \nbut got: #{test_result}"
    end
  end
end
