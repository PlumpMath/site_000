{EventEmitter, dispatcher, _, c, Imm, Bluebird, shortid, assign, keys} = require('../__boiler__plate__000__.coffee')()
keyMirror = require ('react/lib/keyMirror')

navi_change_event  = 'navi_change_event'

navigation_actions = require('../actions/navigation_000_.coffee').action_names

# distinct from actions
navigation_locations = keyMirror
    nav_001: null
    nav_002: null
    projects_map_000: null



current_location = navigation_locations.projects_map_000
context_state = off

navigation_store = assign {}, EventEmitter.prototype,

    navigation_locations: navigation_locations

    get_context_state: ->
        return context_state

    bare_off_context_state: ->
        context_state = off # this might or might not 
        # be better than using waitFor pattern

    set_context_state: (buul)->
        context_state = buul
        @emit_navi_change()

    set_current_location: (new_location)->
        current_location = navigation_locations[new_location]
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

        when navigation_actions.go_projects_map_000
            navigation_store.bare_off_context_state()
            navigation_store.set_current_location navigation_locations.projects_map_000

        when navigation_actions.open_context
            navigation_store.set_context_state(on)
            navigation_store.emit_navi_change()

        when navigation_actions.cancel_context
            navigation_store.set_context_state(off)
            navigation_store.emit_navi_change()

        when navigation_actions.nav_001
            navigation_store.set_current_location navigation.nav_001
            navigation_store.emit_navi_change()

        when navigation_actions.nav_002
            navigation_store.set_current_location navigation.nav_002
            navigation_store.emit_navi_change()

        when navigation_actions.nav_003
            navigation_store.set_current_location navigation.nav_003
            navigation_store.emit_navi_change()

        else
            c 'some default case'


module.exports = navigation_store