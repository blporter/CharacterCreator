require_relative 'job'
# Methods for job classes
module JobMethods
  def add_job(job)
    @jobs.push(Job.new(job))
  end

  def level_up(job = nil)
    current = @jobs.select do |j|
      j.level += 1 if j.job == job
    end
    add_job(job) if current.empty?

    @level += 1
    to_add = rand(1..hit_dice(job)) + @modifiers[:Constitution]
    to_add = 1 if to_add < 1
    @max_health += to_add
    @health += to_add
  end

  def hit_dice(job)
    case job.to_s
    when Job::BARBARIAN
      12
    when Job::FIGHTER, Job::PALADIN, Job::RANGER
      10
    when Job::BARD, Job::CLERIC, Job::DRUID, Job::MONK, Job::ROGUE, Job::WARLOCK
      8
    when Job::SORCERER, Job::WIZARD
      6
    else
      0
    end
  end

  def print_jobs
    line = "#{jobs.at(0).level} in #{jobs.at(0)}"
    jobs.each do |job|
      next if job == jobs.at(0)

      line += ", #{job.level} in #{job}"
    end
    line
  end
end
