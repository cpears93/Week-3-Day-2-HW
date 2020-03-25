require('pry-byebug')

require_relative('models/property.rb')


property1 = Property.new({'address' => '10 Kilmarnock Road',
                          'value' => '£400,000',
                          'number_of_rooms' => 2,
                          'buy_or_let_status' => 'let'
                          })

property2 = Property.new({'address' => '1397 Argyle Street',
                          'value' => '£300,000',
                          'number_of_rooms' => 2,
                          'buy_or_let_status' => 'buy'
                          })

property1.save()

property1.buy_or_let_status = 'buy'

property1.update()

properties = Property.all()

binding.pry
nil
