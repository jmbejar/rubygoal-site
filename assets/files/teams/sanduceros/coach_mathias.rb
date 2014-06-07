module Rubygoal
  class CoachMathias < Coach
 
    def name
      "Sanduceros"
    end
 
    def formation(match)
      formation = Formation.new
      # Alineacion inicial del partido
      formation.defenders = [:none, :average, :fast, :average, :none]
      formation.midfielders = [:average, :average, :captain, :none, :average]
      formation.attackers = [:none, :fast, :none, :fast, :average]
 
      # Si faltan 20
      if match.time < 20
        if match.me.losing?
          # Voy perdiendo, todos arriba
          formation.defenders = [:none, :average, :average, :average, :none]
          formation.midfielders = [:none, :average, :average, :none, :average]
          formation.attackers = [:none, :fast, :fast, :captain, :fast]

        elsif match.me.winning?
          #Voy ganando, a defender
          formation.defenders = [:average, :average, :captain, :fast, :average]
          formation.midfielders = [:none, :average, :fast, :average, :average]
          formation.attackers = [:none, :none, :fast, :none, :none]

        end

      end


      # Si la formacion no es valida pongo la inicial
      if !formation.valid?
        formation.defenders = [:average, :average, :fast, :average, :none]
        formation.midfielders = [:average, :none, :captain, :none, :average]
        formation.attackers = [:none, :fast, :none, :fast, :average]
      end

      formation
    end
  end
end
 
