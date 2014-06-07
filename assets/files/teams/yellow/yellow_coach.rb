module Rubygoal
  class YellowCoach < Coach
    def name
      "Yellow"
    end

    def formation(match)
      formation = Formation.new
      if  match.me.score - match.other.score < -1 || (match.me.losing? && match.time < 30 )
        formation.lineup =
          [
            [:none,    :none,    :none,    :none,    :none],
            [:average, :none,    :average, :none,    :average],
            [:average, :average, :none,    :fast, :captain],
            [:average, :none,    :fast, :none,    :fast],
            [:none,    :none,    :none,    :none,    :none]
          ]
      else
        formation.lineup =
          [
            [:none,    :none,    :none,    :none,    :none],
            [:fast,    :average, :none,    :average, :none],
            [:captain, :fast,    :average, :none,    :average],
            [:fast,    :average, :none,    :average, :none],
            [:none,    :none,    :none,    :none,    :none]
          ]
      end
      formation
    end
  end
end
