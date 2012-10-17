jQ = jQuery.noConflict() if typeof jQ == 'undefined'
jQ ->
  if jQ('#category-index').length

    # Switching between selector options
    jQ('.sort-order-selector li').click ->
      jQ(@).parent('ul').find('li').each ->
        jQ(@).removeClass 'active'
      jQ(@).addClass 'active'

    # Prototype for adding boat in comparison
    jQ('div.add-to-comparison').click ->
      console.log "We added boat with id #{jQ(@).data('id')}"