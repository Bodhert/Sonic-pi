$key_map = {
  "c" => key_c(),
  "Db" => key_db
}
$chord_list = $key_map["Db"]

def key_db()
  [
    chord(:Db, :major7), chord(:Eb, :minor7), chord(:F, :minor7), chord(:Gb, :major7),
    chord(:Ab, "7"), chord(:Bb, :minor7)
  ]
end


def key_c()
  [
    chord(:C, :major7), chord(:D, :minor7), chord(:E, :minor7), chord(:F, :major7), chord(:G, "7"),
    chord(:A, :minor7)
  ]
end


def play_progresion(progressions, sleep_time)
  progressions.each do |pos|
    play $chord_list[pos]
    sleep sleep_time
  end
end



live_loop :test do
  use_synth :fm
  puts $chord_list
  play_progresion([0,5,3,4], 1)
end
