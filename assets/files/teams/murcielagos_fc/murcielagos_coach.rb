module Rubygoal
  class MurcielagosCoach < Coach
    def name
      "Murciélagos FC"
    end

    def formation(match)
      formation = Formation.new
      
      base = [
        [:none,    :none,    :none,    :none,    :none],
        [:average, :average, :none,    :none,    :average],
        [:fast,    :none,    :captain, :fast,    :fast],
        [:average, :average, :none,    :none,    :average],
        [:none,    :none,    :none,    :none,    :none],
      ]
            
      murcielago = [
        [:none,    :average, :none,    :none,    :none],
        [:fast,    :average, :none,    :none,    :none],
        [:captain, :fast,    :average, :none,    :average],
        [:fast,    :average, :none,    :none,    :none],
        [:none,    :average, :none,    :none,    :none],
      ]
            
      if match.me.winning? && match.time < 30
        formation.lineup = murcielago
      else
        formation.lineup = base       
      end
      
      formation
    end
  end
  
end