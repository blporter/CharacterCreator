require_relative 'Race/race'
require_relative 'Race/race_methods'
require_relative 'Job/job'
require_relative 'Job/job_methods'
require_relative 'Language/language'
require_relative 'Language/language_methods'

# Parent character class
class Character
  include JobMethods
  include RaceMethods
  include LanguageMethods
  attr_accessor :name, :race, :level, :jobs, :max_health, :health, :size, :speed, :languages, :scores, :modifiers

  def initialize(name, scores, race = nil, job = nil, age = nil, mod1 = nil, mod2 = nil)
    @name = name
    @race = Race.new(race)
    @level = 1
    init_scores(scores)
    init_jobs(job)
    validate_race_stats(mod1, mod2)
    init_languages
    init_modifiers
    init_health
  end

  def init_scores(scores)
    @scores = {}
    @scores = { Strength: scores[0], Dexterity: scores[1], Constitution: scores[2],
                Intelligence: scores[3], Wisdom: scores[4], Charisma: scores[5] }
  end

  def init_jobs(job = nil)
    @jobs = []
    add_job(job)
  end

  def init_languages
    @languages = []
    racial_language(@race)
  end

  def init_modifiers
    @modifiers = {}
    @scores.each do |key, val|
      @modifiers[key] = ((val - 10) / 2).floor
    end
  end

  def init_health
    @max_health = hit_dice(@jobs.at(0)) + @modifiers[:Constitution]
    @health = @max_health
  end

  def increase_stat(stat)
    @scores[stat] += 1
    if stat.equal? :Constitution do
      @max_health += @level
      @health += @level
    end
    end
  end

  def take_damage(num, dice)
    damage = 0
    (1..num).each do
      damage += rand(1..dice)
    end

    puts "#{@name} is attacked! Took #{damage} damage!"

    @health -= damage
    return unless @health <= 0

    @health = 0
    puts "#{name} is knocked unconscious!"
  end

  def use_hit_dice(num)
    max = 0
    @jobs.each do |job|
      max = hit_dice(job.job) if hit_dice(job.job) > max
    end
    puts "#{@name} heals using #{num} hit-dice: Rolled #{heal(num, max)}"
  end

  def heal(num, dice)
    healing = 0
    (1..num).each do
      healing += rand(1..dice)
    end
    @health += healing
    @health = @max_health if @health > @max_health
    healing
  end

  def to_s
    line = "#{name}: <[ Level: #{level} #{race}; Job(s): #{print_jobs}; Health: #{health}/#{max_health} ]>\n\t-- Scores: "
    scores.each do |key, val|
      line += "[ #{key}: #{val} ]"
    end
    line += "\n\t-- Modifiers: "
    modifiers.each do |key, val|
      line += "[ #{key}: #{val} ]"
    end
    line += "\n\t-- Languages: #{print_languages}"
  end
end
