require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @car = cars(:two)
  end

  test "Should create favorite" do
    assert_difference "Favorite.count", 1 do
      post favorites_url(car_id: @car.id)
    end
    assert_redirected_to car_path(@car)
  end


end