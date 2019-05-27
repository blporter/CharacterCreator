require_relative 'language'
# Methods for character language
module LanguageMethods
  def add_language(language)
    @languages.push(Language.new(language))
  end

  def racial_language(race)
    add_language(Language::COMMON)
    case race.to_s
    when Race::DWARF
      add_language(Language::DWARVISH)
    when Race::ELF
      add_language(Language::ELVISH)
    when Race::HALFLING
      add_language(Language::HALFLING)
    when Race::DRAGONBORN
      add_language(Language::DRACONIC)
    when Race::GNOME
      add_language(Language::GNOMISH)
    when Race::HALF_ELF
      add_language(Language::ELVISH)
    when Race::HALF_ORC
      add_language(Language::ORC)
    when Race::TIEFLING
      add_language(Language::INFERNAL)
    else
      return
    end
  end

  def print_languages
    line = languages.at(0).to_s
    languages.each do |language|
      next if language == languages.at(0)

      line += ", #{language}"
    end
    line
  end
end