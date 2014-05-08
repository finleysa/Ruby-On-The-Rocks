$LOAD_PATH << 'db'
require 'sqlite3'

class Database

  def initialize
  end

  def find_drinks(data_array)
    begin
      db = SQLite3::Database.open "drinklist.sqlite3"
      if data_array[0] == "name"
        stm = db.prepare("select title from drink_table where title like '%#{data_array[1]}%' order by title limit 20")
      elsif data_array[0] == "ingredients"
        stm = db.prepare("select title from mytable where ingredients like '%#{data_array[1]}%' order by title limit 10")
      elsif data_array[0] == "cocktail"
        stm = db.prepare("select title, serve, ingredients from mytable where cat='Cocktails' order by random() limit 1")
      elsif data_array[0] == "shot"
        stm = db.prepare("select title, serve, ingredients from mytable where cat='Shots & Shooters' order by random() limit 1")
      end
      rs = stm.execute

      myArray = []
      rs.each do |row|
        myArray << row
      end
      num = 0
      myArray.map { |i| puts i  }

    rescue SQLite3::Exception => e 
      puts "Exception occured"
      puts e
    ensure
      stm.close if stm
      db.close if db
    end
  end
end
