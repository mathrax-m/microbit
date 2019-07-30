live_loop :microbit do
  use_real_time
  x, = sync "/osc/fromP5"
  if(x!=nil)
    synth :pretty_bell, note: [:Db, :Eb, :Gb, :Ab, :Bb][x]
  end
end
