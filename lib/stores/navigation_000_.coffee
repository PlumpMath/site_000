{EventEmitter, dispatcher, _, c, Imm, Bluebird, shortid, assign, keys} = require('../__boiler__plate__000__.coffee')()
keyMirror = require ('react/lib/keyMirror')

navi_change_event  = 'navi_change_event'

navi_states = keyMirror
    deck_000: null
    exhibit_001: null
    exhibit_002: null

current_location = navi_states.exhibit_001



navigation_store = assign {}, EventEmitter.prototype,

    test_000: ->
        c "test000 works"

    set_current_location: (new_location)->

    get_current_location: ->
        return current_location

    emit_navi_change: ->
        @emit navi_change_event

    add_change_listener: (cb)->
        @on navi_change_event, cb

    remove_change_listener: (cb)->
        @removeListener navi_change_event, cb

navigation_store.dispatchToken = dispatcher.register (action) ->

    switch action.type

        when 'nav_000'
            c "dragoon store switch has action_type nav_000"
            navigation_store.emit_navi_change()
        when 'nav_001'
            c 'dragoon store has action type nav_001'

        else
            c 'some default case'


module.exports = navigation_store