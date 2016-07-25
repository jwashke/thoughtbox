var view = {
  setupReadUnreadListeners: function() {
    console.log('running')
    $('.links').on('click', function(event) {
      handlers.delegateLinkClick(event);
    });
  },
  setupSearchListener: function() {
    $('#searchBar').on('input', function() {
      console.log(searchTerm)
      var searchTerm = this.value;
      handlers.searchBox(searchTerm);
    });
  },
  markAsRead: function(id) {
    var li = '.link-' + id;
    var button = '#' + id;
    $(li).addClass('read-link');
    $(li).removeClass('unread-link');
    $(button).text('Mark as unread');
    $(button).addClass('unread');
    $(button).removeClass('read');
  },
  markAsUnread: function(id) {
    var li = '.link-' + id;
    var button = '#' + id;
    $(li).addClass('unread-link');
    $(li).removeClass('read-link');
    $(button).text("Mark as read");
    $(button).addClass('read');
    $(button).removeClass('unread')
  },
  ajaxError: function(id) {
    var li = '.link-' + id;
    $(li).append("<span class='alert alert-danger'>Something went Wrong</span>");
  }
};
