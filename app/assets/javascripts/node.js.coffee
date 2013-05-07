

$("#custom").on "change", ->
  if $("#custom").checked()
    $("#nodev").find("input").each (index) ->
      index.prop "disabled", false
    $("#dev").find("input").each (index) ->
      index.prop "disabled", true
  else
    $("#nodev").find("input").each (index) ->
      index.prop "disabled", true
    $("#dev").find("input").each (index) ->
      index.prop "disabled", false


$("#device_rating").on "change", ->
  unless $("#custom").checked()
    $("#nodev").find("input").each (index) ->
      index.value $("#device_rating").val()

