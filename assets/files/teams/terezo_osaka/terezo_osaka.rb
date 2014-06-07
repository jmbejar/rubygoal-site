module Rubygoal

  class TerezoOsaka < Coach
    def name
      "Terezo Osaka"
    end

    TRAVESANIO = "afcfa -afa- -aa--"
    CONSERVATIVE = "-afa- afcfa -a-a-"
    DEFENSIVE = "-fcf- aafaa -a-a-"

    TIKITIKI = "-aafa -acfa -a-f-"

    ATTACK = "-afa- -faf- aaca-"
    SUPER_ATTACK = "-aaa- -acf- affa-"
    ULTRA_ATTACK = "-aaa- aafa- -fcf-"

    def formation(match)

        if match.me.draw? || match.me.winning?
          formation_from_str TIKITIKI
        else
          r = rand(1..3)
          if r == 1
            formation_from_str ATTACK
          else
            if r == 2
              formation_from_str SUPER_ATTACK
            else
              formation_from_str ULTRA_ATTACK
            end
          end
        end

    end

    private

      def formation_from_str(formation_str)
        #"aa-aa a-f-a -fcf-"

        form_arrays = formation_str.split

        def_array = form_arrays[0].split('')
        mid_array = form_arrays[1].split('')
        att_array = form_arrays[2].split('')

        format_array def_array
        format_array mid_array
        format_array att_array

        formation = Formation.new
        formation.defenders = def_array
        formation.midfielders = mid_array
        formation.attackers = att_array

        formation
      end

      def format_array(arr)
        replace_occurences(arr, "a", :average)
        replace_occurences(arr, "f", :fast)
        replace_occurences(arr, "c", :captain)
        replace_occurences(arr, "-", :none)

        arr
      end

      def replace_occurences(arr, elem, repl)
        idx = arr.index(elem)
        while idx != nil do
          arr[idx] = repl
          idx = arr.index(elem)
        end
      end

  end
end