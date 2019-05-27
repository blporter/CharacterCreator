# Job class for each humanoid character
class Job
  attr_accessor :job, :level

  BARBARIAN = 'Barbarian'.freeze
  BARD = 'Bard'.freeze
  CLERIC = 'Cleric'.freeze
  DRUID = 'Druid'.freeze
  FIGHTER = 'Fighter'.freeze
  MONK = 'Monk'.freeze
  PALADIN = 'Paladin'.freeze
  RANGER = 'Ranger'.freeze
  ROGUE = 'Rogue'.freeze
  SORCERER = 'Sorcerer'.freeze
  WARLOCK = 'Warlock'.freeze
  WIZARD = 'Wizard'.freeze

  def initialize(job)
    @job = validate_job(job)
    @level = 1
  end

  def validate_job(args)
    line = args.nil? ? 'FIGHTER' : args.upcase
    Job.const_defined?(line) ? Job.const_get(line) : Job.const_get('FIGHTER')
  end

  def to_s
    job
  end
end
