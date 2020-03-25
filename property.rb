require('pg')

class Property
  attr_accessor :address, :value, :number_of_rooms, :buy_or_let_status
  attr_reader :id
  def initialize (options)
    @address = options ['address']
    @value = options ['value']
    @number_of_rooms = options ['number_of_rooms']
    @buy_or_let_status = options ['buy_or_let_status']
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})

    sql=
    "INSERT INTO property_tracker
    (address,
    value,
    number_of_rooms,
    buy_or_let_status
    )
    VALUES
    (
      $1,
      $2,
      $3,
      $4
    )
    RETURNING *
    "

    values = [@address, @value, @number_of_rooms, @buy_or_let_status]

    db.prepare("save", sql)

    @id = db.exec_prepared("save", values)[0]["id"].to_i

    db.close()
 end

 def Property.all()

   db = PG.connect( {dbname: 'property_tracker', host: 'localhost'} )

   sql = "SELECT * FROM property_tracker"

   db.prepare("all", sql)
   orders = db.exec_prepared("all")

   db.close()
   p property.first()
   return property.map {|order| Property.new(property)}

 end

 def Property.delete_all()
   db = PG.connect( { dbname: 'property_tracker',
                        host: 'localhost'} )

   sql = "DELETE FROM property"

   db.prepare('delete_all', sql)

   db.exec_prepared("delete_all")

   db.close()
 end

 def delete
   db = PG.connect( {dbname: 'property_tracker',
                       host: 'localhost'})
   sql = "DELETE FROM property WHERE id = $1"
   values = [@id]
   db.prepare("delete_one", sql)
   db.exec_prepared("delete_one", values)
   db.close()
 end

 def update
   sql = "UPDATE property
     SET
     (
       address,
       value,
       number_of_rooms,
       buy_or_let_status
     ) =
     (
       $1, $2, $3, $4
     )
     WHERE id = $5"
     values = [@address, @value, @number_of_rooms, @buy_or_let_status, @id]
     db.prepare("update", sql)
     db.exec_prepared("update", values)
     db.close

   end

end
