
{EventEmitter, dispatcher, flux, _, c, React, React_DOM, Imm, Bluebird, rr, shortid, assign, keys, math, mm, svg_bp} = require('../__boiler__plate__000__.coffee')()

keyMirror = require ('react/lib/keyMirror')

navigation_actions = keyMirror
    nav_001: null
    nav_002: null
    nav_003: null

    go_projects_map_000: null

    ideas_map_000: null
    projects_000: null
    cancel_context: null
    open_context: null

navigation =

    action_names: navigation_actions

    go_projects_map_000: ->
        dispatcher.dispatch
            type: navigation_actions.go_projects_map_000

    open_context_menu: ->
        dispatcher.dispatch
            type: navigation_actions.open_context

    cancel_context_menu: ->
        dispatcher.dispatch
            type: navigation_actions.cancel_context

    nav_to_002: ->
        dispatcher.dispatch
            type: navigation_actions.nav_002

    nav_to_001: ->
        dispatcher.dispatch
            type: navigation_actions.nav_001


module.exports = navigation