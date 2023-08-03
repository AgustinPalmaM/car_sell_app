require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cars_path
    assert_response :success
    assert_select ".car", 2
  end

  test "should get show" do
    get car_path(cars(:one))
    assert_response :success
    assert_select ".registration", "FFCF53"
    assert_select ".brand", "Kia Motors"
    assert_select ".version", "Rio"
    assert_select ".model", "Rio 3 1.4 Mec"
    assert_select ".year", "2013"
    assert_select ".color",  "Plateado plata"
    assert_select ".price",  "7500000"
    assert_select ".transmission",  "Mec"
    assert_select ".traction", "4X2"
    assert_select ".fuel", "Gasolina"
  end
end
