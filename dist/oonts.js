(function(){window.oonts=function(){var n,o,t,s,i,e,a,r;return a=10,t=125,$("html").css("overflow-x","hidden"),$("div").css("transition","transform "+a+"s").css("transform","rotate(360deg)"),i=6e4/t,e=1e3*a/i,n=new Audio("/oonts.mp3"),window.audio=n,r=0,o=function(){return r+=1,n.currentTime=0,n.play(),$("body").css("animation","oonts "+i+"ms"),$("html").css("animation","rainbow "+i+"ms"),$("body, #main-dashboard").addClass("oonts"),setTimeout(function(){return $("body, html").css("animation","none"),$("body").removeClass("oonts")},.9*i),r>e-1?clearInterval(s):void 0},s=window.setInterval(o,i),o(),window.setTimeout(function(){return clearInterval(s)},1e3*a)}}).call(this);