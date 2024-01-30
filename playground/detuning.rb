live_loop :test do
  detune = (line 0.1, 1, steps: 8)
  synth :dsaw, note: :e3
  synth :dtri, note: :e3 + detune.tick
  sleep 1
end
