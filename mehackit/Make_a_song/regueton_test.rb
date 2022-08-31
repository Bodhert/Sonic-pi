use_bpm 90

live_loop :metronome do
  sample :elec_plip, amp: 1
  sleep 1
end

live_loop :kick do
  sample :drum_heavy_kick
  sleep 1
  sample :drum_heavy_kick
  sleep 1
end

live_loop :hat do
  sample :drum_cymbal_closed
  sleep 0.5
end

live_loop :snare do
  sleep 0.75
  sample :sn_dolf
  sleep 0.75
  sample :sn_dolf
  sleep 0.5
end

live_loop :bass do
  use_synth :bass_foundation
  play :d3
  sleep 1
  play :a2
  sleep 1
  play :g2
  sleep 1
  play :a2
  sleep 1
end


