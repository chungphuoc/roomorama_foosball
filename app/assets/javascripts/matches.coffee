window.App ||= {}
class App.Matches extends App.Base
  constructor: ->
    $('.team-select').select2
      placeholder: "Select users",
      width: '100%'
      maximumSelectionLength: 4

    $('.next-btn').click ->
      $('#team_1').next().removeClass("has-error")
      $('.error-explaination').addClass('hide').html('')
      if $('#team_1').find(":selected").length > 0
        $('.next-btn-group').addClass('hide').removeClass('show')
        $('.save-btn-group, .team2-group').addClass('show').removeClass('hide')
        $('#team_1').prop("disabled", true)
        $.ajax
          url: '/users/list_user'
          dataType: 'text'
          type: 'post'
          data: { user_ids: $('#team_1').val() }
          success: (data, textStatus, jQxhr) ->
            $("#team_2 option").remove()
            $("#team_2").select2("val", "")
            data = JSON.parse(data)
            for item in data
              $("#team_2").append("<option value=#{item.id}>#{item.first_name} #{item.last_name}</option>");
            return
          error: (jqXhr, textStatus, errorThrown) ->
            console.log errorThrown
            return
      else
        $('#team_1').next().addClass("has-error")
        $('.error-explaination').removeClass('hide').html('Please choose at least 1 user')

    $('.back-btn').click ->
      $('.next-btn-group').addClass('show').removeClass('hide')
      $('.save-btn-group, .team2-group').addClass('hide').removeClass('show')
      $('#team_1').prop("disabled", false)

    $('.btn-create-match').click ->
      if $('#team_2').find(":selected").length > 0
        $('#team_1').prop("disabled", false)
        $('form.match_frm').submit()
      else
        $('#team_2').next().addClass("has-error")
        $('.error-explaination').removeClass('hide').html('Please choose at least 1 user')
        return false

  index: ->
    $('.update-result').click (e) ->
      e.preventDefault()
      id = $(e.target).data('id')
      data = {}
      data.authenticity_token = $('meta[name="csrf-token"]').attr('content')
      data.url = $(e.target).data('url')
      data.method = 'put'
      bootbox.dialog
        message: HandlebarsTemplates['matches/update_result'](data)
        title: 'Post Result'
        buttons:
          submit:
            label: 'Update Result'
            className: 'btn-info'
            callback: ->
              checkPostResultForm(e, data.url)
          cancel:
            label: 'Cancel'
            className: 'btn-danger'
    $('.scores-detail').click (e) ->
      match_id = $(e.target).data('id')
      $.ajax
        url: "/matches/#{match_id}/match_game_detail"
        dataType: 'text'
        type: 'get'
        success: (data, textStatus, jQxhr) ->
          data = JSON.parse(data)
          values = data
          bootbox.dialog
            message: HandlebarsTemplates['matches/detail'](values)
            title: 'Match Game Detail'
            buttons:
              cancel:
                label: 'Close'
                className: 'btn-danger'

    checkPostResultForm = (e, url) ->
      error_messages = ""
      flag = true
      scores = $('.scores')
      for score in scores
        if $(score).val() == ""
          flag = false
          $(score).addClass('error-inputs')
      if flag
        $.ajax
          url: url
          dataType: 'text'
          type: 'put'
          data: $('form#post_result').serialize()
          success: (data, textStatus, jQxhr) ->
            data = JSON.parse(data)
            display_result = $(e.target).parent()
            $(display_result).html('')
            $(display_result).append("<a class='btn-sm btn-danger' href='#'>#{data.winner}</a> <a class='btn-sm btn-warning' data-id='#{data.match_id}' href='#'>#{data.team_1} - #{data.team_2}</a>")
          error: (jqXhr, textStatus, errorThrown) ->
            console.log errorThrown
            return
      else
        $('.live-error-message')
          .removeClass('hide')
          .addClass('show')
          .html('Please Enter score value')
        return flag

  edit: ->
    $('.next-btn-group').addClass('hide').removeClass('show')
    $('.save-btn-group, .team2-group').addClass('show').removeClass('hide')
    $('.back-btn').addClass('hide')

