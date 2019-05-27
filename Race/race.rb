# Race class for each humanoid character
class Race
  attr_accessor :race

  DWARF = 'Dwarf'.freeze
  ELF = 'Elf'.freeze
  HALFLING = 'Halfling'.freeze
  HUMAN = 'Human'.freeze
  DRAGONBORN = 'Dragonborn'.freeze
  GNOME = 'Gnome'.freeze
  HALF_ELF = 'Half-Elf'.freeze
  HALF_ORC = 'Half-Orc'.freeze
  TIEFLING = 'Tiefling'.freeze

  def initialize(race)
    @race = validate_race(race)
  end

  def validate_race(args)
    line = args.nil? ? 'HUMAN' : args.to_s.upcase.sub('-', '_')
    Race.const_defined?(line) ? Race.const_get(line) : Race.const_get('HUMAN')
  end

  def to_s
    race
  end
end
