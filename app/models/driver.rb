class Driver < ApplicationRecord
 has_many :passengers, through: :trips
 has_many :trips, dependent: :nullify

 enum status: %i[inactive active]

 validates :name, presence: true
 validates :vin, presence: true

 def total_revenue
   total = 0
   trips.each do |trip|

   total += (trip.cost - 1.65)
   end
   total_revenue = (total * 0.80)
   total_revenue *= 0.01
   return ('%.2f' % total_revenue)
 end

 def all_driver_trips
   trips.all
 end

  def average_rating
    total = 0
    self.trips.each do |trip|
      total += trip.rating
    end
    return total/trips.count.to_f
  end

end
