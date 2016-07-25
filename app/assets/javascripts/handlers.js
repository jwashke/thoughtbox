var handlers = {
  delegateLinkClick: function(event) {
    var target = event.target
    if(target.className === 'read') {
      linkService.markAsRead(event.target.id);
    } else if (target.className === 'unread') {
      linkService.markAsUnread(event.target.id);
    }
  },
  searchBox: function(searchTerms) {
    var $links = $('.link');
    $links.each(function(index, link) {
      var $link = $(link)[0]
      var inName = $link.children[0].innerText.includes(searchTerms)
      var inLink = $link.children[1].innerText.includes(searchTerms)
      console.log($link)
      inName || inLink ? $($link).show() : $($link).hide();
    });
  },
  showAll: function() {
    var $links = $('.link');
    $links.each(function(index, link) {
      var $link = $(link)[0]
      $($link).show();
    });
  },
  showRead: function() {
    this.showAll();
    var $unreadLinks = $('.unread-link')
    $unreadLinks.each(function(index, link) {
      var $link = $(link)[0]
      $($link).hide();
    });
  },
  showUnread: function() {
    this.showAll();
    var $readLinks = $('.read-link')
    $readLinks.each(function(index, link) {
      var $link = $(link)[0]
      $($link).hide();
    });
  }
}
