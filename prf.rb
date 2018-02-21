class Player
 attr_reader :name, :games, :points, :assists
 def initalize(player)
   @name = "#{player[:first_name]} #{player[:last_name]}"
   @games = player[:games].to_f
   @points = player[:points].to_f
   @assists = player[:assists].to_f
 end
 def prf
   avg_points_per_assist = ((assists * 2.0) + (assists * 3.0)) / 2.0
   total_prf = points + avg_points_per_assist
   prf_pg = total_prf / games
   return "#{name} is responsible for #{total_prf.round(0)} points in #{games.round(0)} games. That is #{prf_pg.round(1)} points per game"
 end
end  
