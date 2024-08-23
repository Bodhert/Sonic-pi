def key_B()
  [
    chord(:B, :major7),
    chord(:Db, :minor7),
    chord(:Eb, :minor7),
    chord(:E, :major7),
    chord(:Gb, "7"),
    chord(:Ab, :minor7)
  ]
end

def key_Bb()
  [
    chord(:Bb, :major7),
    chord(:C, :minor7),
    chord(:D, :minor7),
    chord(:Eb, :major7),
    chord(:F, "7"),
    chord(:G, :minor7)
  ]
end


def key_A()
  [
    chord(:A, :major7),
    chord(:B, :minor7),
    chord(:Db, :minor7),
    chord(:D, :major7),
    chord(:E, "7"),
    chord(:Gb, :minor7)
  ]
end

def key_Ab()
  [
    chord(:Ab, :major7),
    chord(:Bb, :minor7),
    chord(:C, :minor7),
    chord(:Db, :major7),
    chord(:Eb, "7"),
    chord(:F, :minor7)
  ]
end

def key_G()
  [
    chord(:G, :major7),
    chord(:A, :minor7),
    chord(:B, :minor7),
    chord(:C, :major7),
    chord(:D, "7"),
    chord(:E, :minor7)
  ]
end

def key_Gb()
  [
    chord(:Gb, :major7),
    chord(:Ab, :minor7),
    chord(:Bb, :minor7),
    chord(:Cb, :major7),
    chord(:Db, "7"),
    chord(:Eb, :minor7)
  ]
end

def key_F()
  [
    chord(:F, :major7),
    chord(:G, :minor7),
    chord(:A, :minor7),
    chord(:Bb, :major7),
    chord(:C, "7"),
    chord(:D, :minor7)
  ]
end


def key_E()
  [
    chord(:E, :major7),
    chord(:Gb, :minor7),
    chord(:Ab, :minor7),
    chord(:Ab, :minor7),
    chord(:B, "7"),
    chord(:Db, :minor7)
  ]
end

def key_Eb()
  [
    chord(:Eb, :major7),
    chord(:F, :minor7),
    chord(:G, :minor7),
    chord(:Ab, :major7),
    chord(:Bb, "7"),
    chord(:C, :minor7)
  ]
end


def key_D()
  [
    chord(:D, :major7),
    chord(:E, :minor7),
    chord(:Gb, :minor7),
    chord(:G, :major7),
    chord(:A, "7"),
    chord(:B, :minor7)
  ]
end


def key_Db()
  [
    chord(:Db, :major7),
    chord(:Eb, :minor7),
    chord(:F, :minor7),
    chord(:Gb, :major7),
    chord(:Ab, "7"),
    chord(:Bb, :minor7)
  ]
end


def key_C()
  [
    chord(:C, :major7),
    chord(:D, :minor7),
    chord(:E, :minor7),
    chord(:F, :major7),
    chord(:G, "7"),
    chord(:A, :minor7)
  ]
end


def play_progresion(progressions, sleep_time)
  progressions.each do |pos|
    play $chord_list[pos]
    sleep sleep_time
  end
end

$key_map = {
  "C" => key_C(),
  "Db" => key_Db(),
  "D" => key_D(),
  "Eb" => key_Eb(),
  "E" => key_E(),
  "F" => key_F(),
  "Gb" => key_Gb(),
  "G" => key_G(),
  "Ab" => key_Ab(),
  "A" => key_A(),
  "Bb" => key_Bb(),
  "B" => key_B()
}

$chord_list = $key_map["B"]

live_loop :test do
  use_synth :fm
  puts $chord_list
  play_progresion([0,5,3,4], 1)
end