var handlers = {
  delegateLinkClick: function(event) {
    var target = event.target
    if(target.className === 'read') {
      linkService.markAsRead(event.target.id);
    } else if (target.className === 'unread') {
      linkService.markAsUnread(event.target.id);
    }
  }
}
