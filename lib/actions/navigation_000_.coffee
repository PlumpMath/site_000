
{EventEmitter, dispatcher, flux, _, c, React, React_DOM, Imm, Bluebird, rr, shortid, assign, keys, math, mm, svg_bp} = require('../__boiler__plate__000__.coffee')()

keyMirror = require ('react/lib/keyMirror')

navigation = keyMirror
    nav_001: null
    nav_002: null
    cancel_context: null
    open_context: null

navigation_actions =

    open_context_menu: ->
        dispatcher.dispatch
            type: navigation.open_context

    cancel_context_menu: ->
        dispatcher.dispatch
            type: navigation.cancel_context

    nav_to_002: ->
        dispatcher.dispatch
            type: navigation.nav_002

    nav_to_001: ->
        dispatcher.dispatch
            type: navigation.nav_001


module.exports = navigation_actions