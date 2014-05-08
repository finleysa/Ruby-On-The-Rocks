class Menu
  def initialize
  end

  def display_menu
    print <<EOS
             MAIN MENU
===================================
1. Find a drink by name
2. Find drink by ingredients
3. Random cocktail
4. Random shot
5. Exit
===================================
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
      print "Your Cocktail!\n---------------\n"
      return ["cocktail"]
    when 4
      print "Your Shot!\n---------------\n"
      return ["shot"]
    when 5
    end
  end

  def get_input
    input = "arbitrary"
    while (1..5).include?(input) == false do
      display_menu
      input = gets.chomp.to_i
      puts "----- Invalid Option -----" if input > 5 or input < 1
    end
    return input
  end

end
