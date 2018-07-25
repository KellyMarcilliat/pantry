require 'pry'
class Pantry
  
  attr_reader       :stock, :shopping_list
  def initialize
    @stock = {}
    @shopping_list = {}
  end 
  
  def stock_check(item)
    if @stock[item] != nil 
      @stock[item]
    else
      0
    end 
  end 
  
  def restock(item, count)
    @stock[item] = stock_check(item) + count 
  end 
  
  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient|
      @shopping_list[ingredient[0]] = ingredient[1]
    end 
    return @shopping_list
  end 
  
  def print_shopping_list
    @shopping_list.each do |key, value|
      "* #{key} #{value}\n"
    end 
  end 
  
  
end
