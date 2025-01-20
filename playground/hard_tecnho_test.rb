use_bpm 128

# Song Idea: Caffeine....
# start with slow tempo, sip a little bit of caffee, increase the tempo, the
# back to the slow tempo again

#cool kick "hard creation"
##| no me gusta mucho como suena este :drum, creo que un efectico lo mejora
with_fx :reverb, room: 0.5, mix: 0.3 do
  with_fx :distortion, distort: 0.9 do
    live_loop :kick do
      sample :bd_haus
      sleep 0.5
      sample :drum_cymbal_closed, rate: 1.5
      sleep 0.5
    end
  end
end

live_loop :synth do
  use_random_seed 3
  use_synth :mod_dsaw
  4.times do
    play (chord :e2, :minor).choose, amp: 0.5
    sleep 1
  end
end


live_loop :bassline do
  use_synth :fm
  with_fx :octaver do
    play :e2, release: 0.5, cutoff: 70
    sleep 0.5
    play :e2, release: 0.5, cutoff: 70
    sleep 0.5
    play :g2, release: 0.5, cutoff: 70
    sleep 0.5
    play :b1, release: 0.5, cutoff: 70
    sleep 0.5
  end
end


live_loop :wub_bass do
  use_synth :fm
  with_fx :slicer, phase: 0.9, wave: 2, mix: 1 do
    with_fx :lpf, cutoff: 70 do
      play :e2, release: 4, amp: 9
      sleep 4
    end
  end
end