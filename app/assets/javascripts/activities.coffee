# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # enable chosen js
  $('.chosen-project-select, .chosen-test-select, .chosen-case-select').chosen({
    no_results_text: 'No results matched',
    width: '300px'
  })

  $('.chosen-project-select').on 'change', ->
    $.ajax
      url: '/testings/find_test?project_id=' + $(this).val()
      dataType: 'json'
      success: (data) ->
        $('.chosen-test-select').empty()
        $.map(data, (item) ->
          $('.chosen-test-select').append '<li value="' + item.id + '">' + item.about + '</li>'
        )
        window.setInterval (->
          $('.chosen-test-select').trigger 'chosen:updated'
          return
        ), 1000
        return
    return
    