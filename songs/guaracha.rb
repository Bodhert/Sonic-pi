use_bpm 128

samples_dir = "~/Workbench/Sonic-pi/resources/guaracha"
load_samples samples_dir

set :counter, 1

live_loop :met do
  current = get[:counter]
  print current
  set :counter, current + 1
  sleep 1
end



define :kick do |length = 4|
  in_thread do
    
    length.times do
      if get[:counter] != 16  then
        sample :bd_ada
        sleep 1
      else
        #redoble part
        ##| sample :bd_ada
        sample :drum_snare_hard, amp: 0.5
        sleep 0.05
        sample :drum_snare_hard
        sleep 0.95
      end
      
    end
    
  end
end

define :clap do |length = 4|
  with_fx :compressor, threshold: 0.9 do
    
    in_thread do
      length.times do
        sample :drum_snare_hard,  hpf: 90, pre_amp: 2
        sleep 1
      end
    end
  end
end

define :percusion  do |length = 16|
  drums = [0,0,0,1,0,0,2,0,0,0,0,1,0,0,2,0]
  in_thread do
    (length * 4).times do
      drums.tick
      sample :tabla_ke1 if drums.look == 1
      sample :tabla_tun1, finish: 0.5 if drums.look == 2
      sleep 0.25
    end
  end
end

# investigate how to cut appropiatly the shaker
define :shaker do |length = 1|
  in_thread do
    length.times do
      samba_shake = sample_paths samples_dir, "samba_shake_128_chopped"
      sample samba_shake, beat_stretch: 4
      sleep 4
    end
  end
end

define :vocals do |length = 4|
  in_thread do
    length.times do
      vocals = sample_paths samples_dir, "160743__qubodup__tribal-battle-chantsshouts"
      sample vocals, onset: 4
      sleep 1
    end
  end
end

with_fx :lpf, cutoff: 100, cutoff_slide: 0.5 do | lpf |
  define :donk do |length = 16|
    use_synth :square
    use_synth_defaults release: 0.25
    in_thread do
      length.times do
        print lpf
        play :G2, amp: 1
        sleep 0.5
        play :G2 + 5, amp: 1 * 0.4
        control lpf, cutoff: 10
        sleep 0.5
      end
    end
  end
end

# investigate how to order by time
##| define :redoble do
##|   in_thread do
##|     16.times do
##|       if get[:counter] == 16 then
##|         sample :drum_snare_hard, amp: 0.5
##|         sleep 0.19
##|         sample :drum_snare_hard
##|         sleep 0.19
##|       end
##|       sleep 1
##|     end
##|   end
##| end





##| kick(16);
##| redoble();
##| clap(16);
##| percusion(16);
##| vocals(16)
##| shaker(4);
donk()

