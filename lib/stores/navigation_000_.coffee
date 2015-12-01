{EventEmitter, dispatcher, _, c, Imm, Bluebird, shortid, assign, keys} = require('../__boiler__plate__000__.coffee')()
keyMirror = require ('react/lib/keyMirror')

navi_change_event  = 'navi_change_event'

navigation = keyMirror
    nav_001: null
    nav_002: null
    cancel_context: null
    open_context: null

current_location = navigation.nav_001
context_state = off



navigation_store = assign {}, EventEmitter.prototype,

    get_context_state: ->
        return context_state

    set_context_state: (buul)->
        context_state = buul
        @emit_navi_change()

    set_current_location: (new_location)->
        current_location = navigation[new_location]
        @emit_navi_change()

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

        when navigation.open_context
            navigation_store.set_context_state(on)
            navigation_store.emit_navi_change()

        when navigation.cancel_context
            navigation_store.set_context_state(off)
            navigation_store.emit_navi_change()

        when navigation.nav_001
            navigation_store.set_current_location navigation.nav_001
            navigation_store.emit_navi_change()

        when navigation.nav_002
            navigation_store.set_current_location navigation.nav_002
            navigation_store.emit_navi_change()

        else
            c 'some default case'


module.exports = navigation_store