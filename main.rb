$LOAD_PATH << "lib"
require 'database'
require 'menu'
require 'sqlite3'

menu = Menu.new
database = Database.new
choice = 'y'
while choice != 'n' or choice == 'no'
  input = menu.get_input
  data = menu.input_options(input)
  database.find_drinks(data)
  print "\nReturn to Main Menu? (y/n): "
  choice = gets.chomp.downcase
end
puts "Thanks for using Ruby on the Rocks"
