require_relative "view"
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

 

  def add
    # ask the user for a recipe name + save it
    name = @view.ask_user_for_name
    # ask the user for the recipe description + save it
    description = @view.ask_user_for_description
    # create a new instance of recipe using the name and description
    recipe_instance = Recipe.new(name, description)
    # call the cookbook.create and pass inside the instance
    @cookbook.create(recipe_instance)    
  end

  def list
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end

  def remove
    list
    number_to_delete = @view.ask_for_deletion
    @cookbook.destroy(number_to_delete)
  end

end