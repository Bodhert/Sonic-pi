##| use_bpm 200
live_loop :clap do
  #Metralleta sound
  use_synth :sc808_clap
  ##| use_synth_defaults slope_start: 4, slope_length1: 2,
  ##|   slope_intermediate: 111, slope_length2: 30,  sustain: 4, boost: 1, res: 0.9
  ##| play 80
  play 10
  sleep 1 / 2.0 / 2.0 / 2.0 / 2.0 / 2.0
  ##| play
end