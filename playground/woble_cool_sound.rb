custom_ring = (line 0,1, steps: 6)

puts custom_ring

5.times do
  with_fx :slicer, phase: 0.125, probability: custom_ring.tick do
    synth :tb303, note: :e1, cutoff_attack: 8, release: 8
    synth :tb303, note: :e2, cutoff_attack: 4, release: 8
    synth :tb303, note: :e3, cutoff_attack: 2, release: 8
    sleep 8
  end
end
