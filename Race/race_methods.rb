require_relative 'race'
# Methods for character race
module RaceMethods
  def set_values(size, speed)
    @size = size
    @speed = speed
  end

  def validate_race_stats(mod1 = nil, mod2 = nil)
    case @race.to_s
    when Race::DWARF
      set_values('Medium', 25)
      @scores[:Constitution] += 2
    when Race::ELF
      set_values('Medium', 30)
      @scores[:Dexterity] += 2
    when Race::HALFLING
      set_values('Small', 25)
      @scores[:Dexterity] += 2
    when Race::HUMAN
      set_values('Medium', 30)
      @scores.each_key do |key|
        @scores[key] += 1
      end
    when Race::DRAGONBORN
      set_values('Medium', 30)
      @scores[:Strength] += 2
      @scores[:Charisma] += 1
    when Race::GNOME
      set_values('Small', 25)
      @scores[:Intelligence] += 2
    when Race::HALF_ELF
      set_values('Medium', 30)
      @scores[:Charisma] += 2
      @scores[mod1] += 1 if @scores.key?(mod1)
      @scores[mod2] += 1 if @scores.key?(mod2)
    when Race::HALF_ORC
      set_values('Medium', 30)
      @scores[:Strength] += 2
      @scores[:Constitution] += 1
    when Race::TIEFLING
      set_values('Medium', 30)
      @scores[:Intelligence] += 1
      @scores[:Charisma] += 2
    else
      set_values('Medium', 30)
    end
  end
end