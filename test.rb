require_relative 'character'

grog = Character.new('Grog', [15, 14, 18, 5, 8, 12], 'Human', 'Barbarian')
grog.add_language('Giant')
grog.level_up('Monk')
grog.level_up('Barbarian')

grog.take_damage(6, 8)
grog.use_hit_dice(1) if grog.health > 0
puts grog

vex = Character.new('Vex\'ahlia', [8, 16, 13, 11, 10, 14], 'Half-Elf', 'Ranger', :Dexterity, :Intelligence)
vex.add_language('Undercommon')
vex.level_up('Ranger')
vex.level_up('Rogue')
puts vex

percy = Character.new('Percy', [8, 15, 12, 13, 11, 13], nil, nil)
puts percy

me = Character.new('Mephalrith', [8, 10, 12, 16, 12, 14], 'Tiefling', 'Warlock')
puts me
