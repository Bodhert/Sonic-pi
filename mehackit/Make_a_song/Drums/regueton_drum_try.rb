use_bpm 300

live_loop :metronome do
  sample :elec_plip, amp: 1
  sleep 1
end

live_loop :kick do
  sample :drum_heavy_kick
  sleep 4
  sample :drum_heavy_kick
  sleep 4
end

live_loop :hat do
  sample :drum_cymbal_closed
  sleep 2
end

live_loop :snare do
  sleep 3
  sample :sn_dolf
  sleep 3
  sample :sn_dolf
  sleep 2
end
