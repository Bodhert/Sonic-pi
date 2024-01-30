notes = (scale :e3, :minor_pentatonic)
sn = synth :prophet, note: :e1, release: 16, cutoff: 100
sleep 1

puts notes
times = (ring 16, 17, 18)
times.tick(:times).times do |i|
  control sn, note: notes.tick
  if i == times[0] - 1
    sleep 1
  else
    sleep 0.125
  end
end

tick_reset

times.tick(:times).times do |i|
  control sn, note: notes.tick
  puts times[1]-2
  if i == times[1] - 1
    sleep 1
  else
    sleep 0.125
  end
end

tick_reset

times.tick(:times).times do |i|
  control sn, note: notes.tick
  if i == times[2] - 1
    sleep 1
  else
    sleep 0.125
  end
end



##| control sn, note: notes.tick, cutoff: rrand(70, 130)
