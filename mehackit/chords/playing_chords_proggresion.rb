$chord_list = []
def generate_chords_key(key)
  $chord_list.push(chord(:C, :major7))
  $chord_list.push(chord(:D, :minor7))
  $chord_list.push(chord(:E, :minor7))
  $chord_list.push(chord(:F, :major7))
  $chord_list.push(chord(:G, "7"))
  $chord_list.push(chord(:A, :minor7))
end

def play_progresion(progressions, sleep_time)
  progressions.each do |pos|
    play $chord_list[pos]
    sleep sleep_time
  end
end


generate_chords_key("any")

live_loop :test do
  use_synth :fm
  play_progresion([0,5,3,4], 1)
end