module Rubygoal
  class Wilman < Coach
    def name
      "Caracas F.C"
    end

    def formation(match)
      formation = Formation.new

      odds = [5,5,3]

      if match.time > 50
        formation.lineup = [
          [:none,     :none,    :none,    :none,    :none],
          [:average,  :fast,    :none,    :average, :none],
          [:average,  :captain, :none,    :none,    :none],
          [:average,  :fast,    :average, :none,    :fast],
          [:none,     :none,    :none,    :average, :none]
        ]
        elsif match.time % odds[rand(3)] == 0
            formation.lineup = [
              [:none,     :none,    :none,    :none,    :average],
              [:average,  :fast,    :none,    :fast,    :none],
              [:none,     :none,    :average, :captain, :none],
              [:average,  :none,    :average, :none,    :fast],
              [:none,     :none,    :none,    :average, :none]
            ]
         else
            formation.lineup = [
              [:none,     :none,    :none,    :average, :none],
              [:average,  :average, :none,    :none,    :fast],
              [:fast,     :none,    :average, :none,    :none],
              [:average,  :none,    :none,    :captain, :fast],
              [:none,     :none,    :average, :none,    :none]
            ]
      end

      formation
    end
  end
end