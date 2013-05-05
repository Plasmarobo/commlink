# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

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
      index.value $("#device_rating").value()

select_node = (this, nodeid) ->
