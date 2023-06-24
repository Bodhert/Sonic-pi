key = 60
s = synth :saw, note: key, sustain: 10, note_slide: 0.5
sleep 2
control s, note: 72

# possible future project will be to
# somehow figure out how to read the
# mouse scroll and conver it to midi
live_loop :bend do
  adr, change = sync
  control s, note: key + change
end
