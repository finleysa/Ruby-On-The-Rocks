$LOAD_PATH << 'models'
$LOAD_PATH << 'database'

require 'drink'
require 'database'

class Menu
  def initialize
  end

  def display_menu
    print <<EOS
            MAIN MENU
=================================
1. Find a drink by name
2. Find drink by ingredients
3. Random cocktail
4. Random shot
5. Add a new drink to database
6. Update a drink in the database
7. Remove a drink from database
=================================
Enter a menu number:
EOS
  end

  def input_options(input)
    case input
    when 1
      print "Input drink name: "
      drink = gets.chomp
      puts
      return ["name", drink]
    when 2
      puts "Input ingredients:"
      ingredients = gets.chomp
      puts
      return ["ingredients", ingredients]
    when 3
      print "\nYour Cocktail!\n---------------\n"
      return ["cocktail"]
    when 4
      print "\nYour Shot!\n---------------\n"
      return ["shot"]
    when 5
      db = Database.new
      print "Drink name: "
      name = gets.chomp
      statement = "select * from drink_table where title=(?)"
      if db.execute(statement, name)
        drink = Drink.new(name)
        # If the user inputs the wrong type number the menu will display once again
        while true
          print "\nWhat type of beverage is this?
  1. Cocktail
  2. Shot or Shooter
  3. Beer / Ale
  4. Non-Alcoholic
  5. Other Drinks\n" 
          type = gets.chomp.to_i
          if (1..5).include?(type)
            drink_type = "Cocktail" if type == 1
            drink_type = "Shots & Shooters" if type == 2
            drink_type = "Beer / Ale" if type == 3
            drink_type = "Non-Alcoholic" if type == 4
            drink_type = "Other Drinks" if type == 5
            drink.add_category(drink_type)
            break
          else
            puts"\nInvalid input, try again please."
          end
        end
        print "\nInput ingredients for #{name}:\n"
        ingredients = gets.chomp
        drink.add_ingredients(ingredients)
        print "\nInstructions to create this:\n"
        method = gets.chomp
        drink.add_method(method)
        print "\nWhat should this be served inside of:\n"
        serve = gets.chomp
        drink.add_serve(serve)
        print "\nSave this drink to the database? (y/n): "
        answer = gets.chomp.downcase
        drink.save if answer == "y" || answer == "yes"      
        return 0
      else
        puts "Invalid name"
        return 0
      end
    when 6
       print "Drink name: "
      name = gets.chomp
      drink = Drink.new(name)
      # If the user inputs the wrong type number the menu will display once again
      while true
        print "\nWhat type of beverage is this?
  1. Cocktail
  2. Shot or Shooter
  3. Beer / Ale
  4. Non-Alcoholic
  5. Other Drinks\n" 
        type = gets.chomp.to_i
        if (1..5).include?(type)
          drink_type = "Cocktail" if type == 1
          drink_type = "Shots & Shooters" if type == 2
          drink_type = "Beer / Ale" if type == 3
          drink_type = "Non-Alcoholic" if type == 4
          drink_type = "Other Drinks" if type == 5
          drink.add_category(drink_type)
          break
        else
          puts"\nInvalid input, try again please."
        end
      end
      print "\nInput ingredients for #{name}:\n"
      ingredients = gets.chomp
      drink.add_ingredients(ingredients)
      print "\nInstructions to create this:\n"
      method = gets.chomp
      drink.add_method(method)
      print "\nWhat should this be served inside of:\n"
      serve = gets.chomp
      drink.add_serve(serve)
      print "\nUpdate this drink in the database? (y/n): "
      answer = gets.chomp.downcase
      drink.update if answer == "y" || answer == "yes"      
      return 0
      
    when 7
      print "\nName of drink: "
      drink_name = gets.chomp
      print "\nAre you sure you want to delete #{drink_name}? (y/n): "
      answer = gets.chomp.downcase
      if answer == 'y' || answer == 'yes'
        Drink.delete(drink_name)
      end
      return 0
    end
  end

  def get_input
    input = "arbitrary"
    while (1..7).include?(input) == false do
      display_menu
      input = gets.chomp.to_i
      puts "-------- Invalid Option ---------\n" if input > 7 or input < 1
    end
    return input
  end

end
