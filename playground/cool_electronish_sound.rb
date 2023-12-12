define :my_sound do
  use_synth :bass_foundation
  sample :drum_bass_hard, rate: rrand(0.5, 2)
  play chord(:e3, :minor).pick, release: 2, cutoff: rrand(60, 130)
  sleep 0.5 / 2 / 2
end

in_thread(name: :looper) do
  loop do
    my_sound
  end
end
