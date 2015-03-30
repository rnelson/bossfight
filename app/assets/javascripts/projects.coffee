# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.project-list').each ->
    employee_id = $(this).attr('id').substring 18

    $(this).sortable(
      tolerance: 'pointer'
      containment: $(this)
      items: '.project-item'
      stop: ->
        # Get an ordered list of the project IDs
        ordered = $(this).sortable('toArray')

        $.each ordered, (index, value) ->
          field = employee_id + '-' + value
          priority = (index + 1)

          # Update the hidden fields on the page to match the new ordering
          $('#' + field).attr('value', priority)

          # Update the number in the list
          $('#priority-' + field).text(priority + '.')

          return

        return
    ).disableSelection()
    return

  return
