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
          $('.chosen-test-select').append '<option value="' + item.id + '">' + item.about + '</option>'
        )
        $('.chosen-test-select').trigger 'chosen:updated'
        return
    return
    
  $('.chosen-test-select').on 'change', ->
    $.ajax
      url: '/testings/find_case?test_id=' + $(this).val()
      dataType: 'json'
      success: (data) ->
        $('.chosen-case-select').empty()
        $.map(data, (item) ->
          $('.chosen-case-select').append '<option value="' + item.id + '">' + item.title + '</option>'
        )
        $('.chosen-case-select').trigger 'chosen:updated'
        return
    return
