module Rubygoal
  class PiedCoach < Coach
    def name
      "Pied Pipers"
    end

    def formation(match)
      formation = Formation.new

      if match.time <= 30 && (match.me.score - match.other.score > 1)
        formation.lineup = [
          [:average,  :none,    :none,    :none,    :none],
          [:fast,     :average, :none,    :none,  :average],
          [:fast,  :average,    :captain, :none,  :none],
          [:fast,     :average, :none,    :none,    :none],
          [:average,  :none,    :none,    :none,    :none],
        ]
      else
        d = match.other.formation.defenders

        if d[0] == :none && d[4] == :none && d[1] != :none && d[2] != :none && d[3] != :none
          formation.lineup = [
            [:none,     :none,    :none,    :average,    :none],
            [:average,  :none,    :average, :none,    :none],
            [:fast,     :fast,    :none,    :captain, :fast],
            [:average,  :none,    :average, :none,    :none],
            [:none,     :none,    :none,    :average,    :none],
          ]
        else
          formation.lineup = [
            [:none,     :none,    :none,    :none,    :none],
            [:average,  :none,    :average, :none,    :average],
            [:fast,     :fast,    :none,    :captain, :average],
            [:average,  :none,    :average, :none,    :fast],
            [:none,     :none,    :none,    :none,    :none],
          ]
        end
      end

      formation
    end
  end
end