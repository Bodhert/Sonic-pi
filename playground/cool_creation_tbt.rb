use_synth :tb303
live_loop :squelch do
  ##| use_random_seed 6
  ##| notes = (scale :e3, :minor_pentatonic).shuffle.tick
  n = (ring :e1, :e2, :e3).choose
  play n, release: rand(), cutoff: rrand(80, 130), res: rand(), wave: 0
  puts 1.0 / 8
  sleep 0.125
end
