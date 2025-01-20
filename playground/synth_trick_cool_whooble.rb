# this creation came from https://in-thread.sonic-pi.net/t/lofi-house-my-first-code/6834/10
# studing that creation
with_fx :slicer, phase: 1, wave: 0, invert_wave: 1, mix: 0.9 do
  live_loop :cool_synth do
    use_synth :mod_fm
    with_fx :pitch_shift, pitch: -3.9, reps: 2 do
      ##| play chord(:a3, "m11"), pan: 1, decay: 4, sustain_level: 0, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.2, mod_wave: 3 if chordon == 1
      ## if I change the sustain_level it creates a cool wooble effect
      play chord(:a3, "m11"), pan: -1, decay: 4, sustain_level: 4, sustain: 0, release: 0.01, divisor: 1, mod_range: 0.3, mod_wave: 3
      sleep 4
    end
  end
end