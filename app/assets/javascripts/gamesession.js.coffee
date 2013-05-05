# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

parse_sel_submit = (source, form, data_placeholder) ->
  $("#" + source).children().each (index) ->
    $("#" + data_placeholder).value($("#" + data_placeholder).value() +", "  + index.value())
  $("#" + form).submit()