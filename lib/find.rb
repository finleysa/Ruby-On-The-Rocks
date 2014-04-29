require 'sqlite3'
class Find
  def find_drinks(data_array)
    begin
      db = SQLite3::Database.open "drinklist.sqlite3"
      if data_array[0] == "name"
        stm = db.prepare("select title from mytable where title like '%#{data_array[1].to_s}%' order by title limit 10")
      elsif data_array[0] == "ingredients"
        stm = db.prepare("select title from mytable where ingredients like '%#{data}%' order by title limit 10")
      end
      rs = stm.execute

      rs.each do |row|
        puts row.join "\s"
    end

    rescue SQLite3::Exception => e 
      puts "Exception occured"
      puts e
    ensure
      stm.close if stm
      db.close if db
    end
  end
end
