require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @car = cars(:two)
    @favorite_car = cars(:one)
  end

  test "Should create favorite" do
    assert_difference "Favorite.count", 1 do
      post favorites_url(car_id: @car.id)
    end
    assert_redirected_to car_path(@car)
  end

  test "Should destroy favorite" do
    assert_difference "Favorite.count", -1 do
      delete favorite_url(@favorite_car.id)
    end
    assert_redirected_to car_path(@favorite_car)
  end
end