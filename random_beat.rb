live_loop :beat do
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_snare_soft
  sleep 0.5
end
live_loop :hihat do
  sleep 0.5
  sample :drum_cymbal_closed
  sleep 0.5
end
live_loop :lead do
  with_fx :slicer do
    chords = [(chord :A4, :minor7), (chord :A4, :minor), (chord :D4, :minor7), (chord :F4, :major7)]
    use_synth :blade
    play chords.choose, attack: 1, release: 2, amp: 1
    sleep 2
  end
end

in_thread do
  use_synth :beep
  loop do
    play chord(:Db4,:minor)
    sleep 0.5
    play chord(:Db4,:minor)
    sleep 1.75
    play chord(:B3,:major)
    sleep 0.5
    play chord(:b3,:major)
    sleep 1.75
  end
end
live_loop :melody do
  use_synth :mod_fm
  use_synth_defaults attack: 0.25, release: 0.5, pan: rrand(-0.5, 0.5), cutoff: 50
  play 72
  sleep 0.25
  play 76
  sleep 0.25
  play 76
  sleep 0.25
end