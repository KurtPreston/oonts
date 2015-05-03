unless $?
  # Load jQuery if not loaded yet
  jqueryJs = document.createElement('script')
  jqueryJs.setAttribute(
    'src',
    'https://code.jquery.com/jquery-1.11.3.min.js'
  )
  document.body.appendChild(jqueryJs)

# Load oonts JS
unless window.oonts?
  oontsJs = document.createElement('script')
  oontsJs.setAttribute(
    'src',
    'https://cdn.rawgit.com/KurtPreston/oonts/master/dist/oonts.js'
  )
  document.body.appendChild(oontsJs)

  # Load oonts CSS
  oontsCss = document.createElement('link')
  oontsCss.setAttribute('rel', 'stylesheet')
  oontsCss.setAttribute(
    'href',
    'https://cdn.rawgit.com/KurtPreston/oonts/master/dist/oonts.css'
  )
  document.body.appendChild(oontsCss)

# Call oonts
$(document).ready ->
  window.oonts()
