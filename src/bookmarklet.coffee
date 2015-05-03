loadScript = (url, callback) ->
  head = document.getElementsByTagName('head')[0]
  script = document.createElement('script')
  script.src = url

  # Attach handlers for all browsers
  done = false
  script.onload =
  script.onreadystatechange = ->
    if !done and (!@readyState or @readyState == 'loaded' or @readyState == 'complete')
      done = true
      # Continue your code
      callback()
      # Handle memory leak in IE
      script.onload = script.onreadystatechange = null
      head.removeChild script

  head.appendChild script

loadOonts = ->
  # Load oonts JS
  if window.oonts?
    window.oonts()
  else
    # Load CSS
    oontsCss = document.createElement('link')
    oontsCss.setAttribute('rel', 'stylesheet')
    oontsCss.setAttribute(
      'href',
      'https://cdn.rawgit.com/KurtPreston/oonts/master/dist/oonts.css'
    )
    document.head.appendChild(oontsCss)

    oontsCss.onload =
    oontsCss.onreadystatechange = ->
      loadScript('https://cdn.rawgit.com/KurtPreston/oonts/master/dist/oonts.js', -> window.oonts())

if $? && $.fn?
  loadOonts()
else
  # Load jQuery if not loaded yet
  loadScript('https://code.jquery.com/jquery-1.11.3.min.js', loadOonts)
