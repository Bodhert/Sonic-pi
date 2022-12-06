samples_folder = "/Users/bodhert/Music/Samples/voice_records"

define :granular do |times, start, ended, sleeping|
  for i in 0..times
    sample samples_folder, "test.wav", start: start, finish: ended
    start += 0.03
    sleep sleeping
  end
end

live_loop :elixir_beam do
  with_fx :reverb,  room: 0.9 do
    granular 5, 0, 0.14, 0.1
    sleep 1
    granular 5, 0.15, 0.30, 0.1
    sleep 1
    granular 5, 0.36, 0.49, 0.3
    granular 5, 0.50, 0.60 , 0.1
  end
  
end