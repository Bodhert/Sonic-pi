samples_folder = "/Users/bodhert/Music/Samples/voice_records"

define :granular do |times, start, ended, sleeping|
  for i in 0..times
    sample samples_folder, "test.wav", beat_stretch: 4, start: start, finish: 0.14
    start += 0.03
    sleep sleeping
  end
end

live_loop :elixir_beam do
  granular 5, 0, 0.14, 0.1
  sleep 1
  granular 5, 0.15, 0.30, 0.1
  sleep 1
end