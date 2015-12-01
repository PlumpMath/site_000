
{EventEmitter, dispatcher, flux, _, c, React, React_DOM, Imm, Bluebird, rr, shortid, assign, keys} = require('../__boiler__plate__000__.coffee')()

keyMirror = require ('react/lib/keyMirror')


action_types =
    nav_000: null

actions = keyMirror action_types

action_functions =

    nav_to_000: ->
        c 'going nav to 000 from actions file'
        dispatcher.dispatch
            type: actions.nav_000


module.exports = action_functions