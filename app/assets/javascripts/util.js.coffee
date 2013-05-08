
window.select_list_item = (object, value, classtarget , value_field) ->
  is_sel = $(object).hasClass classtarget
  $("." + classtarget).each (index) ->
    $(this).removeClass classtarget
  $(object).attr("value", value)
  if $(value_field).length
    $(value_field).val value
  if is_sel is false
    $(object).addClass classtarget

window.move_sel = (source, classtarget, dest) ->
  $(source).find("." + classtarget).each (index) ->
    $(this).removeClass classtarget
    $(dest).append $(this).clone()
    $(this).remove()

window.remove_sel = (source, classtarget) ->
  $(source).find("." + classtarget).each (index) ->
    $(this).remove()

window.parse_sel_submit = (form, target, secrets) ->
  for key of secrets
    if secrets.hasOwnProperty(key)
      $(key).find(target).each ->
        if $(secrets[key]).val().length
          $(secrets[key]).val $(secrets[key]).val() + "," + $(this).attr("value")
        else
          $(secrets[key]).val $(this).attr("value")

window.supress_edit = () ->
  $(".EditTag").each (index) ->
    $(this).remove()

window.supress_delete = () ->
  $(".DeleteTag").each (index) ->
    $(this).remove()
    