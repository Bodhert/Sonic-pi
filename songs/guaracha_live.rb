use_bpm 128

samples_dir = "~/Workbench/Sonic-pi/resources/guaracha"
load_samples samples_dir

live_loop :met do
  ##| play 60
  sleep 1
end

live_loop :kick, sync: :met do
  stop
  sample :bd_ada
  sleep 1
end

##| #chuck
with_fx :compressor, threshold: 0.9 do
  live_loop :clap, sync: :met do
    stop
    sample :drum_snare_hard,  hpf: 90, pre_amp: 2
    sleep 1
  end
end


# Perc
drums = [0,0,0,1,0,0,2,0,0,0,0,1,0,0,2,0]
live_loop :perc, sync: :met do
  ##| stop
  drums.tick
  sample :tabla_ke1 if drums.look == 1
  sample :tabla_tun1, finish: 0.5 if drums.look == 2
  sleep 0.25
end



live_loop :shaker_3, sync: :met do
  ##| stop
  samba_shake = sample_paths samples_dir, "samba_shake_128"
  puts samba_shake
  sample samba_shake, beat_stretch: 5
  sleep 5
end


live_loop :vocals, sync: :met do
  stop
  ## this can be take advantange of the onset and can be randomized
  vocals = sample_paths samples_dir, "160743__qubodup__tribal-battle-chantsshouts"
  sample vocals, onset: 4
  sleep 1
end

live_loop :redoble, sync: :met do
  stop
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_snare_hard
  sleep 0.25
  sleep 1.5
end



