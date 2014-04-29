$LOAD_PATH << "lib"
require 'drink_data'
require 'menu'
require 'sqlite3'

menu = Menu.new
find = Find.new
input = menu.get_input
data = menu.input_options(input)
find.find_drinks(data)
#puts "Thanks for using my App" if input == 5
