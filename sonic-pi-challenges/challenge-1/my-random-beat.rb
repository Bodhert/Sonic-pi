# Welcome to Sonic Pi

##| sample_url:  https://freesound.org/people/deadrobotmusic/sounds/615326/

random_sample = "/Users/bodhert/Workbench/Sonic-pi/sonic-pi-challenges/challenge-1/615326__deadrobotmusic__sidechain-tutorial-bass-160bpm-24b.wav"
load_sample random_sample

l = lambda {|c| puts c ; c.choose()}
live_loop :test do
  use_random_seed 35
  8.times do
    sample random_sample, onset: l, norm: 1, sustain: 0, release: 0.9
    sleep [0.125, 0.25].choose
  end
end

##| play 80

##| sample :loop_amen, start: 0.125, finish: 0.25
