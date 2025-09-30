# Welcome to Sonic Pi
live_loop :met do
  sleep 1
end

live_loop :drum, sync: :met do
  # winner choose two numbers
  sample :bd_haus if (spread 3, 8).tick
  sleep 0.25
end

live_loop :hat, sync: :met do
  # winner choose two numbers
  sample :hat_bdu if (spread 6, 9).tick
  sleep 1
end


live_loop :melody, sync: :met do
  tonic = :C
  
  # winner choose 3 numbers beetwenn 1-7
  first = (chord_degree 1, tonic, :major)
  second = (chord_degree 5, tonic, :major)
  third = (chord_degree 7, tonic, :major)
  play_chord  first
  with_synth :bass_foundation do
    play first[0], release: 2
  end
  sleep 1
  
  play_chord second
  with_synth :bass_foundation do
    play second[0], release: 2
  end
  sleep 1
  
  play_chord third
  with_synth :bass_foundation do
    play third[0], release: 2
  end
  sleep 1
  
end




