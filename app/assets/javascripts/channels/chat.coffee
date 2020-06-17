jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $inputCurrentUser = $('.input__current--user')
  $inputActiveUser = $('.input__active--user')
  $newMessageForm = $('.form__message-new')
  $newMessageBody = $newMessageForm.find('.form__input-body')
  $newMessageAttachment = $newMessageForm.find('.form__input-attachment')
  $newConvo = $('.newStart')

  # $newMessageImageAttachment = $newMessageForm.find('.form__input-attachment-image')
  # $newMessageDocumentAttachment = $newMessageForm.find('.form__input-attachment-doc')
  
  currentUser = $inputCurrentUser.val()

  if true
    App.chat = App.cable.subscriptions.create {
      channel: 'ChatChannel'
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      currentUser = parseInt($inputCurrentUser.val())
      activeUser = parseInt($inputActiveUser.val())

      
      if data['receiver_id'] == parseInt(currentUserRuby) && !currentUser
        $(".messageAlert").html("<div class=\"notificationInnerBox\">New Message</div><div class=\"notificationInnerBox2\">" + data['message']  + "</div>").hide().fadeIn(500);
        setTimeout ->
          $(".messageAlert").fadeOut("1000");
        , 6000



      # if !currentUser 
      #   if currentUser == data['receiver_id']
      #     console.log(data['receiver_id'])
          # # alert(currentUserName)
          # $(".messageAlert").html("<div class=\"notificationInnerBox\">New Message</div> <div class=\"notificationInnerBox2\">" + data['message'] + "</div>").hide().fadeIn(500);
          # # setTimeout ->
          # #   $(".messageAlert").fadeOut("1000");
          # # , 6000

      if activeUser != -1
        if data['receiver_id'] == currentUser
          if data['sender_id'] == activeUser
            if data['message']
              messageTemplate = ''
              if (data['sender_id'] == parseInt(currentUser))
                messageTemplate = "<div class='message align-right'><span class='senderMessage'>#{data['message']}</span></div>"
              else
                messageTemplate = "<div class='message align-left'><span class='receiverMessage'>#{data['message']}</span></div>"
              $messages.append messageTemplate
              $messages.animate { scrollTop: $(document).height() + "1000px" }, "slow"
              # make message status as read
              $.ajax '/chats/read_messages/' + data['message_id'],
                type: 'POST'
                dataType: 'json'
                error: (jqXHR, textStatus, errorThrown) ->
                    alert textStatus
                success: (data, textStatus, jqXHR) ->
                    console.log('success')

          else
            selector = ".chat__contact--element[data-id='#{data['sender_id']}']"
            $(selector).addClass('is-new-message')
            $(selector).addClass('has_unread_messages')

        if data['message']
          if data['sender_id'] == currentUser

            # $newMessageVideoAttachment.val('')
            # $newMessageImageAttachment.val('')
            $newMessageAttachment.val('')

            # $newMessageDocumentAttachment.val('')

            $newMessageBody.val('')
            $newMessageBody.text('')
          
            messageTemplate = ''
          
            if (data['sender_id'] == parseInt(currentUser))
              messageTemplate = "<div class='message align-right'><span class='senderMessage'>#{data['message']}</span></div>"
            else
              messageTemplate = "<div class='message align-left'><span class='receiverMessage'>#{data['message']}</span></div>"
            $messages.append messageTemplate
      
      # if data['message']
      #   $newMessageVideoAttachment.val('')
      #   $newMessageImageAttachment.val('')
      #   $newMessageDocumentAttachment.val('')
      #   $newMessageBody.val('')
      #   $newMessageBody.text('')
      # 
      #   messageTemplate = ''
      # 
      #   if (data['user'] == parseInt(currentUser))
      #     messageTemplate = "<div class='message align-left'>#{data['message']}</div>"
      #   else
      #     messageTemplate = "<div class='message align-right'>#{data['message']}</div>"
      #   $messages.append messageTemplate
        
    send_message: (message, file_uri, original_name) ->
      @perform 'send_message', message: message, file_uri: file_uri, original_name: original_name
      $newConvo.empty()

    $newMessageForm.submit (e) ->
      if !!!$inputActiveUser.val()
        alert('Please select a user to send message first!')
        return
      
      $this = $(this)

      messageBody = {
        content: $newMessageBody.val(),
        sender_id: $inputCurrentUser.val(),
        receiver_id: $inputActiveUser.val()
      }

      if $.trim(messageBody).length > 0 or $newMessageAttachment.get(0).files.length > 0 
        #Scroll Top
        if $newMessageAttachment.get(0).files.length > 0 # if file is chosen
          reader = new FileReader()  # use FileReader API
          fileName = $newMessageAttachment.get(0).files[0].name # get the name of the first chosen file
          reader.addEventListener "loadend", -> # perform the following action after the file is loaded
            App.chat.send_message messageBody, reader.result, fileName  # send message with file
            # at this point reader.result is a BASE64-encoded file
            
        #   reader.readAsDataURL $newMessageVideoAttachment.get(0).files[0] # read file in base 64 format
        # else if $newMessageImageAttachment.get(0).files.length > 0 # if file is chosen
        #   reader = new FileReader()  # use FileReader API
        #   fileName = $newMessageImageAttachment.get(0).files[0].name # get the name of the first chosen file
        #   reader.addEventListener "loadend", -> # perform the following action after the file is loaded
        #     App.chat.send_message messageBody, reader.result, fileName  # send message with file
        #     # at this point reader.result is a BASE64-encoded file
            
        #   reader.readAsDataURL $newMessageImageAttachment.get(0).files[0] # read file in base 64 format
        # else if $newMessageDocumentAttachment.get(0).files.length > 0 # if file is chosen
        #   reader = new FileReader()  # use FileReader API
        #   fileName = $newMessageDocumentAttachment.get(0).files[0].name # get the name of the first chosen file
        #   reader.addEventListener "loadend", -> # perform the following action after the file is loaded
        #     App.chat.send_message messageBody, reader.result, fileName  # send message with file
        #     # at this point reader.result is a BASE64-encoded file
            
          reader.readAsDataURL $newMessageAttachment.get(0).files[0] # read file in base 64 format
        else
          App.chat.send_message messageBody
        $messages.animate { scrollTop: $(document).height() + "1000px" }, "slow"
      e.preventDefault()
      return false
