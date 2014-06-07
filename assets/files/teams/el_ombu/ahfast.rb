module Rubygoal
  class Ahfast < Coach

    def initialize(*args)
      super(*args)
      @step = 0
    end

    def name
      'El Ombu'
    end

    def formation(match)
      formation = Formation.new
      @step += 1
      lineup = case @step
      when 1..60
        [
        [:none,    :none,    :none, :none, :none],
        [:average, :average, :average, :none, :none],
        [:fast,    :fast, :captain, :average, :none],
        [:average, :average, :fast, :none, :none],
        [:none,    :none,    :none, :none, :none]]
      when 61..180
        [
        [:none,    :none,    :none, :none, :none],
        [:average, :average, :none, :fast, :average],
        [:fast,    :average, :fast, :captain, :none],
        [:average, :none, :average, :none, :none],
        [:none,    :none,    :none, :none, :none]]
      when 181..360
        @step = 61 if @step == 360
        [
        [:none,    :none,    :none, :none, :none],
        [:average, :none, :average, :fast, :average],
        [:fast,    :average, :average, :none, :captain],
        [:average, :none, :none, :fast, :none],
        [:none,    :none,    :none, :none, :none]]
      end

      formation.lineup = lineup
      formation
    end
  end
end
