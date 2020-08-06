jQuery(document).on('turbolinks:load', () => {
  App.chat_online = App.cable.subscriptions.create({
    channel: 'UserStatusChannel'
  }, {
    connected: () => {},
    disconnected: () => {},
    received: (data) => {
      const changedUserId = data.user_id;
      const $changedUserStatusIcon = $(`.chat__contact--element-status[data-user-id="${changedUserId}"]`);

      if (data.status && !$changedUserStatusIcon.hasClass('online')) { // user has been changed to online
        $changedUserStatusIcon.removeClass('offline');
        $changedUserStatusIcon.addClass('online');
      }
      if (!data.status && !$changedUserStatusIcon.hasClass('offline')) { // user has been changed to offline
        $changedUserStatusIcon.removeClass('online');
        $changedUserStatusIcon.addClass('offline');
      }
    }
  });
});