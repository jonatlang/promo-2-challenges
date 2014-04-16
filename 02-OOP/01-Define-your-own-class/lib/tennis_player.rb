class TennisPlayer
  def initialize(country, ranking, prizemoney)
    @name = country
    @ranking = ranking
    @prizemoney= prizemoney
  end
end

roger_federer = Tennis_Player.new("Switzerland", "5", 80_846_307)
Raphael_nadal = Tennis_Player.new("Spain", "1", 66_746_320)
novak_djockovich = Tennis_Player.new ("serbia","2", 60,271,921)

def fullinfo
    "#{country}, #{ranking},#{prizemoney}"
end
Richard_Gasquet = TennisPlayer.new ("France", "11", 10_313_116)
puts Richard_Gasquet.ranking