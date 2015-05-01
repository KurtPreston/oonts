window.oonts = ->
  partyTimeSec = 10
  bpm = 125

  # Spin it!
  $('html').css('overflow-x', 'hidden')
  $('div')
    .css('transition', "transform #{partyTimeSec}s")
    .css('transform', 'rotate(360deg)')

  # Oonts it!
  intervalTimeMs = 60 * 1000 / bpm
  numRepeats = partyTimeSec * 1000 / intervalTimeMs
  audio = new Audio('../dist/oonts.mp3')
  window.audio = audio

  repeats = 0
  bangIt = ->
    repeats += 1

    # Crank it!
    audio.currentTime = 0
    audio.play()

    # Strobe it!
    $('body').css('animation', "oonts #{intervalTimeMs}ms")
    $('html').css('animation', "rainbow #{intervalTimeMs}ms")
    $('body, #main-dashboard').addClass('oonts')
    setTimeout( ->
      $('body, html').css('animation', 'none')
      $('body').removeClass('oonts')
    , intervalTimeMs * 0.9)

    # Just breathe...
    if repeats > numRepeats - 1
      clearInterval(interval)

  interval = window.setInterval(bangIt, intervalTimeMs)
  bangIt()

  # Turn that awful thing off before I call the cops!
  window.setTimeout( ->
    clearInterval(interval)
  , partyTimeSec * 1000)
