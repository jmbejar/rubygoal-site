module Rubygoal
  class Derby < Coach
    def name
      "Derby County"
    end
    
    def formation(match)
      formation = default_formation
      if match.me.score - match.other.score >= 2 then
        formation = catenaccio
      elsif match.time < 20 and !match.me.winning? then
        formation = attack!
      end
      formation
    end
    
    def default_formation
      formation = Formation.new
      formation.lineup = [
        [:none,     :average,  :none,     :none,     :none],
        [:average,  :none,     :average,  :captain,  :fast],
        [:fast,     :fast,     :none,     :none,     :average],
        [:average,  :none,     :average,  :none,     :none],
        [:none,     :none,     :none,     :none,     :none],
      ]
      formation
    end
    
    def catenaccio
      formation = Formation.new
      formation.lineup = [
        [:average,  :none,     :average,  :none,     :none],
        [:average,  :none,     :none,     :average,  :none],
        [:captain,  :fast,     :none,     :none,     :fast],
        [:fast,     :none,     :none,     :none,     :none],
        [:average,  :average,  :none,     :none,     :none],
      ]
      formation
    end
    
    def attack!
      formation = Formation.new
      formation.lineup = [
        [:none,  :none,     :none,     :none,     :none],
        [:none,  :none,     :average,  :captain,  :fast],
        [:fast,  :average,  :none,     :average,  :average],
        [:none,  :none,     :average,  :average,  :fast],
        [:none,  :none,     :none,     :none,     :none],
      ]
      formation
    end
  end
end
