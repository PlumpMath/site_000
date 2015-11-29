{EventEmitter, dispatcher, flux, _, c, React, React_DOM, Imm, Bluebird, rr, shortid, assign, keys, math, mm, svg_bp} = require('../__boiler__plate__000__.coffee')()

program_state = {}




dragoon_store = assign {}, EventEmitter.prototype,
    
    test_000: ->
        c "we're in dragoon_store in the test_000 function."

    test_001: ->

dragoon_store.dispatchToken = dispatcher.register (action) ->
    c 'dragoon got an action', action

    #switch action.type
    # blah blah blah


module.exports = dragoon_store