window.display_in_pane = (pane, url, json) ->
  $.ajax
    url: url
    async: true
    type: "POST"
    data: json
    dataType: "html"
    success: (data, txStatus, jqXHR) ->
      $(pane).html data
    beforeSend: (XHR) ->
      display_loading_notice "Loading data", "NoticeWindow"
      myTrigger = setInterval(->
        if XHR.readyState > 2
          totalBytes = XHR.getResponseHeader("Content-length")
          dlBytes = XHR.responseText.length
          (if (totalBytes > 0) then progress(Math.round((dlBytes / totalBytes) * 100), ".NoticeWindow", ".NoticeBarFill", hide_loading_notice(".NoticeWindow")) else $(".NoticeWindow").html((dlBytes / 1024) + "Kb"))
          if `dlBytes == totalBytes`
            clearInterval(myTrigger)
      , 10)

window.display_loading_notice = (text, target) ->
  notice = "<div class='" + target + "'>" + text + "<div class='NoticeBar'><div class='NoticeBarFill'></div></div></div>"
  $("body").append notice
  $("." + target).css 
    left: (($(window).width()/2) - ($("." + target).width()/2))
    top: (($(window).height()/2) - ($("." + target).width()/2)) 

window.hide_loading_notice = (target) ->
  $(target).remove()

window.progress = (percent, container, bar) ->
  done = ->
    setTimeout(->
      if `progressBarWidth == $(bar).parent().width()`
        hide_loading_notice(container)
     , 500) 
  progressBarWidth = percent * $(bar).parent().width() / 100
  $(container).find(bar).animate(
    width: progressBarWidth
  , 200, done).html percent + "%&nbsp;"