#!/usr/bin/env ruby

$LOAD_PATH << "lib"
$LOAD_PATH << "models"
require 'database'
require 'menu'
require 'sqlite3'

menu = Menu.new
database = Database.new
choice = 'y'
while choice != 'n' or choice == 'no'
  input = menu.get_input
  data = menu.input_options(input)
  # If 0 is returned that means a drink was added or removed from the DB
  database.find_drinks(data) if data != 0
  print "\nReturn to Main Menu? (y/n): "
  choice = gets.chomp.downcase
end
puts "Thanks for using Ruby on the Rocks!"
