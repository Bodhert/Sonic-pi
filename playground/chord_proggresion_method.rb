live_loop :play_proggresion do
  use_synth :fm
  proggresions = [:i, :v, :iii]
  proggresions.each do |progg|
    puts chord_degree progg, :C, :major
    puts chord(:B, :major7)
    play chord_degree progg, :C, :major
    sleep 1
  end
end
