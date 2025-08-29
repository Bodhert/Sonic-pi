use_bpm 80
use_synth_defaults
use_synth :piano
##| play (chord, :c, :maj)
##| puts (chord, :c, :maj)
##| play note(:C, octave: 8)


live_loop :met do
  sleep 1
end

first_verse = [:E, :F, :G]
first_times = [2,1,1]
second_verse = [:G, :F, :E, :D]
third_vesse = [:C,:C, :D, :E]
fourth_versse = [:E, :D]
##| f
live_loop :escucha_amigo, sync: :met do
  play_pattern_timed first_verse, first_times
  play_pattern_timed second_verse, 1
  play_pattern_timed third_vesse, 1
  play_pattern_timed fourth_versse, [2,2]
end


live_loop :bass, sync: :met do
  
  with_synth :bass_foundation do
    play_pattern_timed [:C,:G], 4, amp: 0.8
  end
end


live_loop :percusion, sync: :met do
  
  sample :perc_bell
  sleep 1
  sample :tabla_dhec
  sleep 1
end
