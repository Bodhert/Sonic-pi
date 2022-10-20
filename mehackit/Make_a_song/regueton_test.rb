use_bpm 90

##| live_loop :metronome do
##|   sample :elec_plip, amp: 1
##|   sleep 1
##| end

##| live_loop :kick do
##|   sample :drum_heavy_kick
##|   sleep 1
##|   sample :drum_heavy_kick
##|   sleep 1
##| end

##| live_loop :hat do
##|   sample :drum_cymbal_closed
##|   sleep 0.5
##| end

##| live_loop :snare do
##|   sleep 0.75
##|   sample :sn_dolf
##|   sleep 0.75
##|   sample :sn_dolf
##|   sleep 0.5
##| end

##| live_loop :bass do
##|   use_synth :bass_foundation
##|   play :e1, amp: 0.4
##|   sleep 1
##|   play :e1, amp: 0.4
##|   sleep 1
##|   play :g1, amp: 0.4
##|   sleep 1
##|   play :b0, amp: 0.4
##|   sleep 1
##| end

live_loop :melody do
  if one_in(6)
    use_transpose -2
  else
    use_transpose 0
  end
  
  play_pattern_timed [:e4, :g4, :b4, :e4, :a4, :c5, :e4, :g4, :b4, :b3, :eb4, :gb4], [0.5, 0.5, 1, 0.5, 0.5, 1]
end


