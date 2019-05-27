# Language class for each humanoid character
class Language
  attr_accessor :language

  COMMON = 'Common'.freeze
  DWARVISH = 'Dwarvish'.freeze
  ELVISH = 'Elvish'.freeze
  GIANT = 'Giant'.freeze
  GNOMISH = 'Gnomish'.freeze
  GOBLIN = 'Goblin'.freeze
  HALFLING = 'Halfling'.freeze
  ORC = 'Orc'.freeze
  ABYSSAL = 'Abyssal'.freeze
  CELESTIAL = 'Celestial'.freeze
  DRACONIC = 'Draconic'.freeze
  DEEP_SPEECH = 'Deep Speech'.freeze
  INFERNAL = 'Infernal'.freeze
  PRIMORDIAL = 'Primordial'.freeze
  SYLVAN = 'Sylvan'.freeze
  UNDERCOMMON = 'Undercommon'.freeze

  def initialize(language)
    @language = validate_language(language)
  end

  def validate_language(args)
    line = args.nil? ? 'COMMON' : args.upcase
    Language.const_defined?(line) ? Language.const_get(line) : Language.const_get('COMMON')
  end

  def to_s
    language
  end
end
