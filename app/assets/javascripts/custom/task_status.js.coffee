TaskStatus = window.TaskStatus = change: ->
  $(document).on "click", "#accept", ->
    $.ajax
      url: "tasks/" + $(this).val()
      type: "PUT"
      data:
        task:
          status: "done"

      success: (response) ->

    return

  return