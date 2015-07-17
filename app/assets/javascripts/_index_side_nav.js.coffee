$ ->
  (($) ->
    $window = $(window)
    $sidebar = $('#hide-off-right-medium')
    $wrapper = $('#off-canvas-wrapper')
    $arrow = $('.right-off-canvas-menu')
    console.log $('#hide-off-right-medium')

    resize = ->
      if $window.width() < 1025
        return $sidebar.addClass('right-off-canvas-menu')
      $sidebar.removeClass 'right-off-canvas-menu'
      $wrapper.removeClass 'move-left'



    $window.resize(resize).trigger 'resize'

  ) jQuery
  