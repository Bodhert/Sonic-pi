i = 1
while i > 0
  with_fx :wobble, phase: i, phase_slide: 5 do |e|
  use_synth :dsaw
  play 50, release: 5
  control e, phase: 0.025
  sleep 5
end
i -= 0.1
end

