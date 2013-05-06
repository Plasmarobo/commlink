
window.select_node = (target, nodeid, classtarget) ->
  $("." + classtarget).each (index) ->
    $(index).removeClass classtarget
  $("#nodeid").val nodeid
  $(target).addClass classtarget

window.move_sel = (source, classtarget, dest) ->
  $("#" + source).children("." + classtarget).each (index) ->
    $("#" + dest).add index
    $(index).remove()

window.remove_sel = (source, classtarget) ->
  $("#" + source).children("." + classtarget).each (index) ->
    $(index).remove()

window.parse_sel_submit = (source, form, data_placeholder) ->
  $("#" + source).children().each (index) ->
    $("#" + data_placeholder).value $("#" + data_placeholder).val()(+", " + index.val())
  $("#" + form).submit()

$("#custom").on "change", ->
  if $("#custom").checked()
    $("#nodev").children("input").each (index) ->
      index.prop "disabled", false

    $("#dev").children("input").each (index) ->
      index.prop "disabled", true

  else
    $("#nodev").children("input").each (index) ->
      index.prop "disabled", true

    $("#dev").children("input").each (index) ->
      index.prop "disabled", false


$("#device_rating").on "change", ->
  unless $("#custom").checked()
    $("#nodev").children("input").each (index) ->
      index.value $("#device_rating").val()

