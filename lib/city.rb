class City
  attr_reader :name, :id

  def initialize(city)
    @name = city[:name]
    @id = city[:id]
  end

  def self.all
    returned_cities = DB.exec('SELECT * FROM cities;')
    cities = []
    returned_cities.each do |city|
      id = city['id'].to_i
      name = city['name']
      cities.push(City.new({name: name, id: id}))
    end
    cities.sort_by {|city| city.name}
  end

  def self.find(id)
    returned_city = DB.exec("SELECT * FROM cities WHERE id = #{id};").first
    City.new({:name => returned_city['name'], :id => returned_city['id'].to_i})
  end

  def save
    @id = DB.exec("INSERT INTO cities (name) VALUES ('#{self.name}') RETURNING ID;").first['id'].to_i
  end

  def ==(another_city)
    self.name.==(another_city.name) and self.id.==(another_city.id)
  end

  def update(update_info)
    @name = update_info[:name]
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def delete()
    DB.exec("DELETE FROM cities WHERE id = #{self.id};")
  end

end
