require_relative "recipe"
require 'csv'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def create(recipe)
    @recipes << recipe
    save_to_csv
  end

  def all
    @recipes
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_to_csv
  end

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|        
        csv << [recipe.name, recipe.description]
      end
    end
  end



  def load_csv
    CSV.foreach(@csv_file) do |row|
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

end

# cookbook = Cookbook.new
# pizza = Recipe.new("pizza", "tasty")
# burger = Recipe.new("burger", "tasty")
# p cookbook
# cookbook.create(pizza)
# cookbook.create(burger)
# p cookbook