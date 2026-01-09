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
# is good to start stacking params and see what it does and start evolving.
base = 50
substract = 8
live_loop :contacting_aliens do
  play base, sustain: 2
  sleep 1
  play base + substract, sustain: 1, mod_phase_offset: 1, mod_invert_wave: 1,
    mod_range: 8.9, mod_phase: 0.009, env_curve: 4, amp: 0.2, attack: 3
  sleep 1
  play base - substract, sustain: 1, mod_phaser_offset: 0.5, mod_wave: 3, mod_range: 3.72
  play base, sustain: 2, mod_phase: 0.009, env_curve: 1, amp: 0.5, decay: 6
  sleep 1
end

