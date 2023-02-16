class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end

  
end

# pizza = Recipe.new("pizza", "tasty")
# p pizza