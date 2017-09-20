class Train
  attr_reader :name, :id, :color

  def initialize(choo_choo)
    @name = choo_choo[:name]
    @color = choo_choo[:color]
    @id = choo_choo[:id]
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each do |train|
      trains.push(Train.new({name: train["name"], color: train["color"], id: train["id"].to_i}))
    end
    trains.sort_by {|train| train.name}
  end

  def save
    @id = DB.exec("INSERT INTO trains (name, color) VALUES ('#{self.name}', '#{self.color}') RETURNING id;").first['id'].to_i
  end

  def ==(another_train)
    self.name.==(another_train.name) and self.color.==(another_train.color) and self.id.==(another_train.id)
  end

  def update(choo_choo)
    @name = choo_choo[:name]
    @color = choo_choo[:color]
    @id = self.id
    DB.exec("UPDATE trains SET name = '#{self.name}', color = '#{@color}' WHERE id = '#{@id}';")
  end

  def self.delete(id)
    DB.exec("DELETE FROM trains WHERE id = '#{id}';")
  end
end
