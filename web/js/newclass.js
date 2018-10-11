$(function() {
  
    // contact form animations
    $('#newClassbtn').click(function() {
      $('#newClassForm').fadeToggle();
    })
    $(document).mouseup(function (e) {
      var container = $("#newClassForm");
  
      if (!container.is(e.target) // if the target of the click isn't the container...
          && container.has(e.target).length === 0) // ... nor a descendant of the container
      {
          container.fadeOut();
      }
    });
    
  });