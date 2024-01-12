live_loop :habanera do
  use_synth :fm
  use_transpose (ring 1,2,3, -12).tick(:note_pitch)
  8.times do
    play (ring :d, :r, :r, :a, :f5, :r, :a, :r).tick(:note)
    sleep 0.25
  end
end