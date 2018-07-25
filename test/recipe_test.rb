require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class RecipeTest < Minitest::Test
  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20)
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 20)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
  end
  
  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20)
    assert_equal 20, r.amount_required("Flour")
  end
  
  def test_it_stores_ingredients 
    r = Recipe.new("Cheese Pizza")
    assert_equal ({}), r.ingredients 
    r.add_ingredient("Flour", 20)
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 20)
    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients 
  end
   
  


end
