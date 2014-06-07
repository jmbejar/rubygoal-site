require 'rubygoal/coach'
require 'rubygoal/formation'

module Rubygoal
  class CoachAldo < Coach
    def name
      "TTE"
    end

    def formation(match)
      a = :average
      _ = :none
      f = :fast
      c = :captain

      stall = Formation.new
      stall.lineup = [
        [_, a, _, _, _],
        [f, _, a, _, _],
        [f, a, _, c, a],
        [f, _, a, _, _],
        [_, a, _, _, _],
      ]

      #pep
      pep = Formation.new
      pep.lineup = [
        [_, a, _, _, a],
        [f, _, a, _, _],
        [_, a, _, c, f],
        [f, _, a, _, a],
        [_, _, _, _, _],
      ]

      #mirror
      mirror = Formation.new
      mirror.lineup = match.other.formation.lineup

      if match.me.winning?
        team = mirror
      end

      if match.me.draw?
        team = pep
      end

      if match.me.losing?
        team = pep
      end

      team
    end
  end
end
