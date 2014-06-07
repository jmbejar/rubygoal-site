module Rubygoal
  class CarbonerosTillDeath < Coach
    def name
      "CarboneroTillDeath"
    end

    def formation(match)
      formation = Formation.new
      formation.lineup =  [
        [:none,    :none,     :none,       :none,        :none],
        [:none,    :fast,     :fast,       :none,        :average],
        [:average, :none,     :average,    :none,        :average],
        [:average, :none,     :average,    :captain,     :fast],
        [:none,    :none,     :none,       :none,        :none]
      ]

      rival = match.other.formation
      rival_lineup = match.other.formation.lineup

      (3..1).each do |i|
        if rival_lineup[i][0] != :fast
          clean_attackers(formation.lineup, :average)
          x = get_index(i)
          formation.lineup[x][4] = :fast
        end
      end

      if match.me.winning?
        if match.time < 10 && (match.me.score-match.other.score <= 2)
          formation.lineup =  [
            [:none,      :none,     :none,     :none,        :none],
            [:average,   :fast,     :average,  :none,        :average],
            [:captain,   :average,  :none,     :fast,        :none],
            [:fast,      :average,  :average,  :none,        :none],
            [:none,      :none,     :none,     :none,        :none]
          ]          

        elsif rival.attackers.count(:none) <3
          formation.lineup =  [
            [:none,      :none,     :none,     :none,        :none],
            [:average,   :fast,     :none,     :none,        :average],
            [:average,   :none,     :fast,     :none,        :average],
            [:average,   :average,  :none,     :captain,     :fast],
            [:none,      :none,     :none,     :none,        :none]
          ]
          (3..1).each do |i|
            if rival_lineup[i][0] == :none
              clean_attackers(formation.lineup, :none)
              x = get_index(i)
              formation.lineup[x][4] = :fast
              if x > 1
                formation.lineup[x-1][4] = :average
              else
                formation.lineup[2][4] = :average
              end
            end
          end
        else
          fast_attackers = 0
          rival_lineup.each_index do |x|
            if rival_lineup.fetch(x).fetch(4) == :fast
              fast_attackers+=1
              i = get_index(x)
              if fast_attackers == 1
                formation.lineup[1][1] = :average
                formation.lineup[i][0] = :fast
                formation.lineup[2][2] = :none

              elsif fast_attackers == 2
                formation.lineup[1][2] = :average
                formation.lineup[3][1] = :none
                formation.lineup[i][0] = :fast
              end
            end
          end
        end
      end

      if match.me.losing?
        if match.time < 20
          formation.lineup =  [
            [:none,      :none,     :none,     :none,        :none],
            [:average,   :none,     :average,  :fast,        :fast],
            [:none,      :average,  :none,     :none,        :average],
            [:average,   :none,     :average,     :captain,     :fast],
            [:none,      :none,     :none,     :none,        :none]
          ] 
        elsif rival.attackers.count(:none) <3
          formation.lineup =  [
            [:none,    :none,     :none,       :none,        :none],
            [:average, :none,     :average,    :fast,        :average],
            [:average, :none,     :none,       :none,        :average],
            [:none,    :average,  :fast,       :captain,     :fast],
            [:none,    :none,     :none,       :none,        :none]
          ]
        end
      end

      if !formation.valid?
        formation.lineup =  [
          [:none,    :none,     :none,       :none,        :none],
          [:average, :none,     :fast,       :none,        :average],
          [:average, :fast,     :none,       :none,        :average],
          [:none,    :average,  :average,    :captain,     :fast],
          [:none,    :none,     :none,       :none,        :none]
        ]
        formation
      else
        formation
      end
    end

    def get_index(index)
      if index == 0
        return 4
      elsif index == 1
        return 3
      elsif index == 3
        return 1
      elsif index == 4
        return 0
      end
      index
    end

    def clean_attackers(lineup, skill)
      (1..3).each do |i|
        lineup[i][4] = skill
      end
    end

  end
end
