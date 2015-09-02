$('#player-modal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var src = button.data('src');
  var modal = $(this);

  modal.find('.modal-body rubygoal-player').attr('src', src);
});
