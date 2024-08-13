## this is not my creation, this is a study session of
## https://gist.github.com/jindrichmynarz/f233f75c719abe6a6c81
## i did modified a couple of things.


use_bpm 130

##| fade_in = (ramp * range(0,1, 0.01))
master = (ramp *range(0,1, 0.01))
snare_volume  = 0.5
fade_in = (ring 0.0 )
hats_volume = 0.5
open_hats_volume = 1
synth_volume = 1
pad_volume = 1
bass_volume = 1
beep_volume = 0.5



live_loop :met do
  sleep 1
end

kick_cutoff = range(50, 80, 0.5).mirror
live_loop :kick, sync: :met do
  stop
  if (spread 1, 4).tick then
    sample :bd_tek,
      amp: master.look * 1,
      cutoff: kick_cutoff.look
  end
  sleep 0.25
end


define :snare do |amp|
  sample :sn_dolf, amp: amp, start: 0.15, finish: 0.35, rate: 0.7
end

live_loop :snares, sync: :met do
  stop
  sleep 1
  snare 1 * master.tick * snare_volume
  sleep 1
end

live_loop :snare_break, sync: :met do
  stop
  sleep 15.75
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      snare 0.5 * master.tick * snare_volume
    end
  end
  sleep 0.25
end


with_fx :rhpf, cutoff: 125, res: 0.8 do
  with_synth :pnoise do
    live_loop :hats, sync: :met do
      stop
      if (spread 3,8).tick then
        play :d1,
          amp: hats_volume * master.tick,
          attack: 0.05,
          decay: 0.08,
          release: 0.1
      end
      sleep 0.25
    end
  end
end



##| stop
with_fx :slicer, mix: 1, phase: 0.25, pulse_width: 0.1 do
  with_fx :hpf, cutoff: 130 do
    with_synth :noise do
      live_loop :noise_hats, sync: :met do
        stop
        play :d1, decay: 1, amp: master.tick * hats_volume
        sleep 1
      end
    end
  end
end

open_hats_cuttof = range(120, 130,0.5).mirror
with_fx :echo,
  amp: 0.5,
  mix: 0.4,
  decay: 4,
phase: 0.75 do
  with_fx :hpf, cutoff: open_hats_cuttof.tick  do
    with_fx :reverb, mix: 0.4, decay: 4, room: 0.8 do
      live_loop :open_hats, sync: :met do
        stop
        sleep 0.5
        sample :drum_cymbal_open, start: 0.2, finish: 0.3, amp: 0.5
        sleep 0.5
      end
    end
  end
end




bassline_rhytm = (ring 1,0,0,0,1,0,0,0,1,0,0.5,0,1,0,0.5,0)
bassline_notes = (stretch [:d1] * 12 + [:f1, :f1, :a1, :f1], 8)
live_loop :bassline, sync: :met do
  ##| stop
  with_synth :fm do
    puts bassline_notes
    puts bassline_notes.look
    play bassline_notes.look,
      amp: master.look * bassline_rhytm.tick * bass_volume,
      attack: 0.03, divisor: 1, depth: 10
  end
  
  sleep 0.25
end


live_loop :revbassline, sync: :met do
  ##| stop
  sleep 7.5
  with_fx :pan, pan: -0.5 do
    with_synth :fm do
      play :d1, amp: master.tick * bass_volume,
        divisor: 0.5,
        attack: 0.5,
        depth: 6
    end
  end
  
  sleep 0.5
end


dchord = chord(:d2, :minor, num_octaves: 3)
synth_cutoffs = range(60, 100, 0.5).mirror
synt_rhythm = (ring 1.5, 1.5,1)
synth_cutoffs = range(60, 100, 0.5).mirror
synth_transposition = (stretch 0, 36) + (stretch -12, 36) + (stretch 12, 6)
synth_pans = (ring -0.5, 0.5)
live_loop :synth, sync: :met do
  ##| stop
  sleep synt_rhythm.tick
  ch = chord_invert(dchord, rand_i(3))
  with_fx :echo, mix: 0.3, amp: synth_volume * master.look do
    with_fx :pan, pan: synth_pans.look do
      with_fx :reverb, room: 0.7, damp: 0.8 do
        with_synth_defaults attack: 0.05, release: 0.3 do
          with_transpose synth_transposition.look do
            with_synth :sine do
              play_chord ch
            end
            cutoff = synth_cutoffs.look
            with_fx :ixi_techno, cutoff_min: cutoff,
            cuttofs_max: cutoff - 30, phase: 1, res: 0.3 do
              with_synth :dsaw do
                play_chord dchord, attack: 0.1
              end
            end
          end
        end
      end
    end
  end
end

define :dubpad do |ch, amp|
  dubpad_mixes = (ring 0.5, 0.5, 0.5, 0)
  dubpad_phases = (ring 8, 8, 8, 0.5)
  dubpad_cutoffs = (range 70, 100, 5).mirror
  with_fx :echo, amp: amp, mix: dubpad_mixes.look,
  phase: 1.5, decay: 2 do
    with_fx :reverb, room: 0.8 do
      with_fx :ixi_techno, phase: dubpad_phases.tick, cutoff_min: 70 do
        with_synth :tb303 do
          with_synth_defaults attack: 0.1, release: 8,
          cutoff: dubpad_cutoffs.look, res: 0.5 do
            play_chord ch
            play_chord ch.map { |n| n + 0.3}
          end
        end
      end
    end
    
  end
  
  
end

live_loop :pad, sync: :met do
  dubpad dchord, master.tick * pad_volume
  sleep 16
end

beep_notes = (ring :d2, :d2, :f2, :e2, :d3, :g2)
live_loop :beeps, sync: :met do
  sleep 0.5
  with_fx :distortion do
    with_synth :beep do
      play beep_notes.tick, amp: beep_volume * master.look,
        decay: 0.2, release: 0.1
    end
  end
  sleep 0.5
end







