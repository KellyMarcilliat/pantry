require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  
  def test_it_exists
    pantry = Pantry.new 
    
    assert_instance_of Pantry, pantry 
  end 
  
  def test_it_has_a_stock_hash
    pantry = Pantry.new 
  
    assert_equal ({}), pantry.stock
  end 
  
  def test_it_can_check_stock
    pantry = Pantry.new 
    
    assert_equal 0, pantry.stock_check("Cheese")
  end 
  
  def test_it_can_restock
    pantry = Pantry.new
    pantry.restock("Cheese", 10) 
    
    assert_equal 10, pantry.stock_check("Cheese")
    
    pantry.restock("Cheese", 20)
    
    assert_equal 30, pantry.stock_check("Cheese")
  end 
  
  def test_it_has_a_shopping_list 
    pantry = Pantry.new 
    
    assert_equal ({}), pantry.shopping_list
  end 
  
  def test_it_can_add_to_shopping_list 
    pantry = Pantry.new 
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20)
    r.add_ingredient("Flour", 20)
    r.add_ingredient("Cheese", 20)
    pantry.add_to_shopping_list(r)
    
    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list
  end 
  
  def test_it_prints_shopping_list
    
    pantry = Pantry.new 
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20)
    r.add_ingredient("Flour", 20)
    r.add_ingredient("Cheese", 20)
    pantry.add_to_shopping_list(r)
    
    assert_equal "* Cheese: 25\n* Flour: 20\n", pantry.print_shopping_list
  end 
  
  # # Adding the recipe to the shopping list
  # pantry.add_to_shopping_list(r)
  # 
  # # Checking the shopping list
  # pantry.shopping_list # => {"Cheese" => 20, "Flour" => 20}
  # 
  # # Adding another recipe
  # r = Recipe.new("Spaghetti")
  # r.add_ingredient("Spaghetti Noodles", 10)
  # r.add_ingredient("Marinara Sauce", 10)
  # r.add_ingredient("Cheese", 5)
  # pantry.add_to_shopping_list(r)
  # 
  # # Checking the shopping list
  # pantry.shopping_list # => {"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10}
  # 
  # # Printing the shopping list
  # pantry.print_shopping_list
  # # * Cheese: 25
  # # * Flour: 20
  # # * Spaghetti Noodles: 10
  # # * Marinara Sauce: 10
  # # => "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"
end
