var linkService = {
  markAsRead: function(id) {
    $.ajax({
      url: '/api/v1/links/' + id,
      type: 'PATCH',
      data: {
        update: 'read'
      }
    })
    .done(function() {
      view.markAsRead(id);
    })
    .fail(function() {
      view.ajaxError(id)
    })
  },
  markAsUnread: function(id) {
    $.ajax({
      url: '/api/v1/links/' + id,
      type: 'PATCH',
      data: {
        update: 'unread'
      }
    })
    .done(function() {
      view.markAsUnread(id);
    })
    .fail(function() {
      view.ajaxError(id)
    })
  }
}
