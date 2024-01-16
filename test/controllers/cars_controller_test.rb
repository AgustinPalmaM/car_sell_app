require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test "should get index" do
    get cars_path
    assert_response :success
    assert_select ".car", 10
    assert_select ".category", 5
  end

  test "should get index cars with filtered camioneta category" do
    get cars_path(category_id: categories(:camioneta).id)
    assert_response :success
    assert_select ".car", 0
  end

  test "should get index cars with filtered automovil category" do
    get cars_path(category_id: categories(:automovil).id)
    assert_response :success
    assert_select ".car", 7
  end

  test "render a list of cars filtered by min price and max price" do
    get cars_path(min_price: 7_000_000, max_price: 10_000_000)
    assert_response :success
    assert_select ".car", 2
    assert_select "p", "Rio 3 1.4 Mec"
  end

  test "sort cars by expensive first" do
    get cars_path(order_by: "expensive")
    assert_response :success
    assert_select ".car", 10
    assert_select ".cars .car:first-child p", "V40 R-Design"
  end

  test "sort cars by cheapest first" do
    get cars_path(order_by: "cheapest")
    assert_response :success
    assert_select ".car", 10
    assert_select ".cars .car:first-child p", "Morning ls 1.0"
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
    assert_select ".price",  "7490000"
    assert_select ".transmission", "Mec"
    assert_select ".traction", "4X2"
    assert_select ".fuel", "Gasolina"
  end

  test "render a new car form" do
    get new_car_path
    assert_response :success
    assert_select "form"
    assert_select "h1", "Create a new car"
  end

  test "create a new car" do
    post cars_path, params: {
      car: {
        registration: "FFCF53",
        brand: "Kia Motors",
        version: "Rio",
        model: "Rio 3 1.4 Mec",
        year: "2013",
        color: "Plateado plata",
        price: "7500000",
        credit_price: "0",
        transmission: "Mec",
        traction: "4X2",
        fuel: "Gasolina",
        category_id: categories(:automovil).id
      }
    }

    assert_redirected_to car_path(Car.last)
    assert_equal flash["notice"], "Created successfully"
  end

  test "create car fail with empty fields" do
    post cars_path, params: {
      car: {
        registration: "FFCF53",
        brand: "",
        version: "Rio",
        model: "Rio 3 1.4 Mec",
        year: "2013",
        color: "Plateado plata",
        price: "7500000",
        credit_price: "0",
        transmission: "Mec",
        traction: "4X2",
        fuel: "Gasolina",
        category_id: categories(:automovil).id
      }
    }

    assert_response :unprocessable_entity
  end

  test "delete car" do
    assert_difference("Car.count", -1) do
      delete car_path(cars(:one))
    end
    assert_redirected_to cars_path
    follow_redirect!
    assert_response :success
    assert_equal flash[:notice], "Deleted ok"
  end

  test "edit car" do
    get edit_car_path(cars(:one))
    assert_response :success
    assert_select "form"
    assert_select "h1", "Edit car"
  end

  test "update car" do
    patch car_path(cars(:one)), params: {
      car: {
        price: "7600000"
      }
    }

    assert_redirected_to car_path(cars(:one))
    assert_equal flash[:notice], "Edited succesfully"
  end
end
