# lo-fi
use_bpm 60

chords =
[
  (chord_degree :iv, :C4, :major),
  (chord_degree :iii, :C4, :major),
  (chord_degree :ii, :C4, :major),
  chord(:C4, :major7),
  chord(:C4, :major7),
]

live_loop :met do
  sleep 1
end


live_loop :chord, sync: :met do
  stop
  use_synth :piano
  play chords.tick, decay: 2
  sleep 2
  play chords.tick, decay: 2
  sleep 2
  play chords.tick, decay: 2
  sleep 2
  play chords.tick, decay: 1
  sleep 1
  play chords.tick, decay: 1
  sleep 1
end

with_fx :distortion do
  with_fx :lpf do
    live_loop :bass, sync: :met do
      stop
      use_synth :subpulse
      play chords.tick[-1], decay: 2, amp: 0.1
      sleep 2
      play chords.tick[-1], decay: 2, amp: 0.1
      sleep 2
      play chords.tick[-1], decay: 2, amp: 0.1
      sleep 2
      play chords.tick[-1], decay: 1, amp: 0.1
      sleep 1
      play chords.tick[-1], decay: 1, amp: 0.1
      sleep 1
    end
  end
end

hats = [1,0,1,0] * 4
live_loop :hats, sync: :met do
  stop
  sample :hat_bdu if hats.tick == 1
  sleep 0.25
end

tom = [1,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0]
live_loop :clap, sync: :met do
  stop
  sample :tabla_ghe1, amp: 0.5 if tom.tick == 1
  sleep 0.5 / 2
end

pattern = [1,0,1,1]
live_loop :test, sync: :met do
  stop
  sample :perc_snap2, amp: 0.5 if pattern.tick == 1
  sleep 1
end

with_fx :bitcrusher do
  live_loop :melody, sync: :met do
    stop
    use_synth :kalimba
    use_random_seed 4
    for _ in 1..8 do
      play chord(:F, :major7), amp: 5
      sleep [0.25, 0.25, 0.5, 1].choose
    end
  end
end


