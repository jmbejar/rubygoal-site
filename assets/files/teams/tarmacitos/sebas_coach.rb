module Rubygoal
  class SebasCoach < Coach

    # 3 - 4 - 1 - 2
    DEFAULT = [
      [:none,     :none,     :average, :none,     :none ],
      [:average,  :none,     :none,    :none,     :fast ],
      [:fast,     :average,  :average, :captain,  :none ],
      [:average,  :none,     :none,    :none,     :fast ],
      [:none,     :none,     :average, :none,     :none ],
    ]

    # 3 - 5 - 2
    CONSERVATIVE =[
      [:none,    :average, :none,       :none,    :none   ],
      [:fast,    :average, :none,       :none,    :none   ],
      [:average, :fast,    :average,    :captain, :none   ],
      [:fast,    :average, :none,       :none,    :none   ],
      [:none,    :average, :none,       :none,    :none   ],
    ]

    # 2 - 1 - 2 - 3 - 2
    GO_FOR_ALL = [
      [:none,    :none,     :none,    :average, :none ],
      [:average, :none,     :average, :none,    :fast ],
      [:none,    :fast,     :none,    :captain, :none ],
      [:average, :none,     :average, :none,    :fast ],
      [:none,    :none,     :none,    :average, :none ],
    ]

    def initialize
      @last_lineup = GO_FOR_ALL
    end

    def name
      "Tarmacitos"
    end

    def formation(match)
      formation = Formation.new

      # If I am winning, just keep the winning lineup
      if match.me.winning? && match.time > 90
        formation.lineup = @last_lineup

      # Aggressive tactic for the first 30 seconds
      elsif match.time > 90
        formation.lineup = GO_FOR_ALL 

      # If I am not losing,
      # try a more 'serious' tactic
      elsif match.time > 30 && match.time < 90 && !match.me.losing?
        formation.lineup = DEFAULT

      elsif match.time <= 30 

        # If I have few time and I am not winning go for all
        if !match.me.winning?
          formation.lineup = GO_FOR_ALL

        # If I have few time and I am winning, go defensive
        else
          formation.lineup = CONSERVATIVE
        end

      # Else, keep playing the same way
      else
        formation.lineup = @last_lineup
      end

      @last_lineup = formation.lineup
      formation
    end
  end

end

