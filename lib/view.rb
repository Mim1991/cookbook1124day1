class View

  def ask_user_for_name
    puts "What's the name of the recipe?"
    gets.chomp
  end

  def ask_user_for_description
    puts "What's the description of the recipe?"
    gets.chomp
  end

  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} : #{recipe.description}"
    end
  end

  def ask_for_deletion
    puts "Which number would you like to delete?"
    gets.chomp.to_i - 1
  end
end