
live_loop :play_proggresion do
  use_synth :fm
  proggresions = [:vii, :v]
  proggresions.each do |progg|
    puts chord_degree progg, :C, :major
    puts chord(:A, :minor7)
    play chord_degree progg, :C, :major
    sleep 1
  end
end
