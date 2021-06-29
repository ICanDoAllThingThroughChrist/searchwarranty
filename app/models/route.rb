class Route < ApplicationRecord
  #belongs_to :route_ton
  def self.create_route
    @heavy_trash_route = Unit.distinct.pluck(:HVY_TRSH_SEC_NAME)
    @recycling_trash_route = Unit.distinct.pluck(:RECY_SEC_NAME)
    @garbage_route= Unit.distinct.pluck(:SEC_NAME)

    @heavy_trash_route.each do|route|
      Route.create(route: "#{route}")
      # binding.pry
    end

    @recycling_trash_route.each do|route|
      Route.create(route: "#{route}")
    end

    @garbage_route.each do |route|
      Route.create(route: "#{route}")
    end

  end
end
