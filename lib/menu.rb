class Menu
  def initialize
  end

  def display_menu
    puts <<EOS
         MAIN MENU
===========================
1. Find a drink by name
2. Enter ingredients to find a drink
3. Random cocktail
4. Random shot
5. Exit
==========================
Enter a menu number:
EOS
  end

  def input_options(input)
    case input
    when 1
      puts "Input drink name:"
      drink = gets.chomp
      return ["name", drink]
    when 2
      puts "Input ingredients:"
    when 3
    when 4
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
