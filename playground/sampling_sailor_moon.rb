# links to both songs
# commercial: https://www.youtube.com/watch?v=kMXGCunLFS4
# song: https://www.youtube.com/watch?v=EeZySCt_fqI&t=3s

commercial = "~/Desktop/commercial.wav"
song = "~/Desktop/sailor.wav"

define :sampleSongL do |sample_song, start, finish, amp=1, rate=0.85, lfp=85|
  sample sample_song,
    start: start,
    finish: finish,
    amp: amp,
    rate: rate,
    lpf: lfp
  sleep sample_duration(sample_song, start: start, finish: finish) / rate
end

with_fx :compressor do
  with_fx :reverb, room: 1 do
    with_fx :distortion, distort: 0.25 do
      set_mixer_control! amp: 3
      ##| sampleSongL(commercial, 0, 1)
      sampleSongL(song, 0.01, 0.134)
      3.times do
        sampleSongL(song, 0.022, 0.134)
      end
      sampleSongL(song, 0.134, 0.243)
      3.times do
        sampleSongL(song, 0.243, 0.35)
      end
      set_mixer_control! amp: 0, amp_slide: 24
      3.times do
        sampleSongL(song, 0.243, 0.35)
      end
    end
  end
end
