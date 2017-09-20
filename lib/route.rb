class Route
  attr_reader :city_start_id, :city_end_id, :train_id, :time, :id

  def intialize(route)
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
      routes.push(Routes.new(:city_start_id route['city_start_id'], :city_end_id route['city_end_id'], :train_id route['train_id'], :time route['time'], :id route['id']))
    end
    routes
  end

  def save
    @id = DB.exec("INSERT INTO routes (city_start_id, city_end_id, train_id, time) VALUES ('#{self.city_start_id}', '#{self.city_end_id}', '#{self.train_id}', '#{self.time}') RETURNING id;").first['id'].to_i
  end

  def search()
end
