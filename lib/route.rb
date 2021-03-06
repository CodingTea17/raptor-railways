class Route
  attr_reader :city_start_id, :city_end_id, :train_id, :time, :id

  def initialize(route)
    @city_start_id = route[:city_start_id]
    @city_end_id = route[:city_end_id]
    @train_id = route[:train_id]
    @time = route[:time]
    @id = route[:id]
  end

  def self.all
    returned_routes = DB.exec("SELECT * FROM routes;")
    routes = []
    returned_routes.each do |route|
      routes.push(Route.new({city_start_id: route['city_start_id'].to_i, city_end_id: route['city_end_id'].to_i, train_id: route['train_id'].to_i, time: route['time'], id: route['id'].to_i}))
    end
    routes
  end

  def save
    @id = DB.exec("INSERT INTO routes (city_start_id, city_end_id, train_id, time) VALUES ('#{self.city_start_id}', '#{self.city_end_id}', '#{self.train_id}', '#{self.time}') RETURNING id;").first['id'].to_i
  end

  def ==(another_route)
    self.city_start_id.==(another_route.city_start_id) and self.city_end_id.==(another_route.city_end_id) and self.id.==(another_route.id) and self.train_id.==(another_route.train_id) and self.time.==(another_route.time)
  end

  def self.find(id)
    returned_route = DB.exec("SELECT * FROM routes WHERE id = #{id};").first
    Route.new({city_start_id: returned_route['city_start_id'].to_i, city_end_id: returned_route['city_end_id'].to_i, train_id: returned_route['train_id'].to_i, time: returned_route['time'], id: returned_route['id'].to_i})
  end

  def self.search(start_c, end_c)
    returned_routes = DB.exec("SELECT * FROM routes WHERE city_start_id = #{start_c} AND city_end_id = #{end_c} ORDER BY \"time\";")
    routes = []
    returned_routes.each do |route|
      routes.push(Route.new({city_start_id: route['city_start_id'].to_i, city_end_id: route['city_end_id'].to_i, train_id: route['train_id'].to_i, time: route['time'], id: route['id'].to_i}))
    end
    routes
  end

  def update(route)
    @city_start_id = route[:city_start_id]
    @city_end_id = route[:city_end_id]
    @train_id = route[:train_id]
    @time = route[:time]
    @id = self.id
    DB.exec("UPDATE routes SET city_start_id = '#{@city_start_id}', city_end_id = '#{@city_end_id}', train_id = '#{@train_id}', time = '#{@time}' WHERE id = '#{@id}';")
  end

  def delete
    DB.exec("DELETE FROM routes WHERE id = #{@id};")
  end
end
