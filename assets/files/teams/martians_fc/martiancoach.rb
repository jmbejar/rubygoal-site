module Rubygoal
  class Martiancoach < Coach
    def name
      "Martians FC"
    end

    def formation(match)
      formation = Formation.new

      conservative = [
          [:none,       :none,   :average,      :none,        :none ],
          [:fast,    :average,      :none,      :average,        :none],
          [:none,       :average,      :captain,   :none,        :fast ],
          [:fast,    :average,      :none,      :none,        :none ],
          [:none,       :none,   :average,      :none,        :none ],
        ]

      aggressive = [
          [:none,       :average,   :none,      :fast,        :none ],
          [:none,    :none,      :none,      :none,        :fast],
          [:average,    :average,      :fast,   :captain,        :average ],
          [:none,    :none,      :none,      :none,        :average ],
          [:none,       :average,   :none,      :none,        :none ],
        ]

      uruguayan = [
          [:average,       :none,   :average,      :none,        :none ],
          [:none,    :average,      :none,      :fast,     :none ],
          [:none,       :none,      :average,   :none,        :captain ],
          [:none,    :fast,      :fast,      :none,     :none ],
          [:average,       :none,   :average,      :none,        :none ],
        ]


      formation.lineup = uruguayan

      if match.me.winning?
        formation.lineup = uruguayan
      elsif match.me.losing?
        formation.lineup = aggressive
      elsif match.me.draw?
        formation.lineup = conservative
      end

      formation
    end
  end

end