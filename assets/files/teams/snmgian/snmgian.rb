module Rubygoal
  class Snmgian < Coach
    def name
      'snmgian'
    end

    class Core
      def standard_lineup
        [
          [:none, :none, :none, :none, :none],
          [:average, :none, :average, :none, :fast],
          [:average, :average, :none, :captain, :fast],
          [:average, :none, :average, :none, :fast],
          [:none, :none, :none, :none, :none]
        ]
      end

      def defensive_lineup
        [
          [:none, :none, :none, :none, :none],
          [:average, :none, :average, :average, :none],
          [:average, :captain, :fast, :none, :fast],
          [:average, :average, :none, :fast, :none],
          [:none, :none, :none, :none, :none]
        ]
      end

      def ultra_defensive_lineup
        [
          [:none, :none, :none, :none, :none],
          [:average, :none, :average, :average, :none],
          [:fast, :captain, :average, :none, :fast],
          [:average, :none, :average, :fast, :none],
          [:none, :none, :none, :none, :none]
        ]
      end

      def antimirror_lineup
        [
          [:none, :none, :none, :none, :none],
          [:average, :none, :average, :average, :none],
          [:average, :captain, :none, :fast, :fast],
          [:average, :none, :average, :fast, :none],
          [:none, :none, :none, :none, :none]
        ]
      end

      def antimirror_defensive_lineup
        [
          [:none, :none, :none, :none, :none],
          [:average, :average, :fast, :none, :none],
          [:average, :captain, :average, :fast, :none],
          [:average, :average, :fast, :none, :none],
          [:none, :none, :none, :none, :none]
        ]
      end

      def attackers_count(lineup_transposed)
        lineup_transposed[3].count { |player| player != :none } \
          + lineup_transposed[2].count { |player| player != :none }
      end

      def lineup(match)
        match_time = match.time.to_i

        unless can_change_lineup?(match_time)
          return @current_lineup
        end

        other_lineup = match.other.formation.lineup
        other_lineup_transp = other_lineup.transpose

        if self.attackers_count(other_lineup_transp) <= 2
          @current_lineup = standard_lineup

        elsif (other_lineup_transp[4].include?(:captain) ||
          other_lineup_transp[3].include?(:captain)) &&
          (other_lineup_transp[4].include?(:fast) ||
          other_lineup_transp[3].include?(:fast))

          @current_lineup = ultra_defensive_lineup

        elsif other_lineup_transp[4].include?(:captain) ||
          other_lineup_transp[4].include?(:fast) ||
          other_lineup_transp[3].include?(:captain) ||
          other_lineup_transp[3].include?(:fast)

          @current_lineup = defensive_lineup
        else
          @current_lineup = standard_lineup
        end


        if other_lineup[2][2] != :none && @current_lineup[2][2] != :none
          #swap!(@current_lineup, [2, 3], [3, 3])
          swap!(@current_lineup, [2, 2], [3, 2])
        end

        if other_lineup[1][3] != :none && @current_lineup[3][1] != :none
          if @current_lineup[2][2] == :none
            swap!(@current_lineup, [3, 1], [2, 2])
          end
        end

        if other_lineup == @current_lineup
          if match.me.winning?
            @current_lineup = antimirror_defensive_lineup
          else
            @current_lineup = antimirror_lineup
          end
        end

        @lineup_changed_on = match_time

        @current_lineup
      end

      def swap!(lineup, a, b)
        lineup[a[0]][a[1]], lineup[b[0]][b[1]] = lineup[b[0]][b[1]], lineup[a[0]][a[1]]
      end

      def can_change_lineup?(time)
        @lineup_changed_on.nil? || time < @lineup_changed_on - 4
      end
    end

    def formation(match)

      formation = Formation.new

      formation.lineup = core.lineup(match)

      formation
    end

    def core
      @coach_core ||= Core.new
    end

  end
end
