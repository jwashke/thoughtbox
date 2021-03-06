var view = {
  setupReadUnreadListeners: function() {
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
  setupSortListeners: function() {
    $('#sort-button').on('click', function() {
      handlers.sortLinksAlphabetically();
    });
  },
  setupFilterListeners: function() {
    var _self = this;
    $('#all-button').on('click', function() {
      _self.removePrimaryFromButtons();
      $('#all-button').addClass('btn-primary');
      handlers.showAll();
    });
    $('#read-button').on('click', function() {
      _self.removePrimaryFromButtons();
      $('#read-button').addClass('btn-primary');
      handlers.showRead();
    });
    $('#unread-button').on('click', function() {
      _self.removePrimaryFromButtons();
      $('#unread-button').addClass('btn-primary');
      handlers.showUnread();
    });
  },
  removePrimaryFromButtons: function() {
    $('#all-button').removeClass('btn-primary');
    $('#read-button').removeClass('btn-primary');
    $('#unread-button').removeClass('btn-primary');
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
