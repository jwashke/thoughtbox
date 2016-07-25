var handlers = {
  delegateLinkClick: function(event) {
    var target = event.target
    console.log(target.className)
    if(target.className === 'read') {
      view.markAsRead(event.target.id);
      console.log(event.target.id);
    } else if (target.className === 'unread') {
      view.markAsUnread(event.target.id);
    }
  }
}
