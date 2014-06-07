require 'rubygoal/coach'
require 'rubygoal/formation'

module Rubygoal
  class LaBandaDeRamon < Coach
    LINEUP_3_3_2_2 = [[:none,    :none, :none,    :none, :none   ],
                      [:average, :none, :average, :fast, :captain],
                      [:average, :none, :average, :none, :none   ],
                      [:average, :none, :average, :fast, :fast   ],
                      [:none,    :none, :none,    :none, :none   ]]

    LINEUP_3_2_3_2 = [[:none,    :none, :none, :average, :none   ],
                      [:average, :none, :fast, :none,    :captain],
                      [:average, :none, :none, :average, :none   ],
                      [:average, :none, :fast, :none,    :fast   ],
                      [:none,    :none, :none, :average, :none   ]]

    LINEUP_4_4_2 = [[:average, :none, :none, :none,    :none   ],
                    [:average, :none, :none, :average, :captain],
                    [:none,    :none, :fast, :fast,    :none   ],
                    [:average, :none, :none, :average, :fast   ],
                    [:average, :none, :none, :none,    :none   ]]

    LINEUP_5_4_1 = [[:average, :average, :none, :none,    :none   ],
                    [:average, :fast,    :none, :none,    :none   ],
                    [:fast,    :none,    :none, :captain, :none   ],
                    [:average, :fast,    :none, :none,    :none   ],
                    [:average, :average, :none, :none,    :none   ]]

    DEFAULT_LINEUP = LINEUP_3_3_2_2

    def name
      "La Banda de Ramon"
    end

    def formation(match)
      formation = Formation.new

      formation.lineup = DEFAULT_LINEUP

      if match.me.winning?
        if match.time < 15
          formation.lineup = LINEUP_5_4_1
        elsif match.time < 20
          formation.lineup = LINEUP_4_4_2
        end
      elsif match.me.losing?
        formation.lineup = LINEUP_3_2_3_2
      end

      formation
    end
  end
end
