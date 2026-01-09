use_synth :mod_beep
##| base = 50
##| play base, sustain: 2
##| sleep 1
##| play base + 12, sustain: 1
##| sleep 1
##| play base - 12, sustain: 1, mod_phase: 0.25
##| play base, sustain: 2
##| sleep 1
##| base = 52
##| play base + 12, sustain: 2
##| sleep 1
##| play base - 12, sustain: 1
##| sleep 1
##| play base + 12, sustain: 1
##| sleep 1
##| play base + 12, sustain: 1
##| sleep 1

# note: 50, 12 was a good combination
base = 50 + 9
substract = 32
live_loop :contacting_aliens do
  play base, sustain: 2
  sleep 1
  play base + substract, sustain: 1
  sleep 1
  play base - substract, sustain: 1, mod_phase: 0.25
  play base, sustain: 2
  sleep 1
end

