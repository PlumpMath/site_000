


{c, React, Imm, rr, shortid, assign, keys, _, React_DOM, gl_mat, Bluebird, dispatcher, EventEmitter} = require('../__boiler__plate__000__.coffee')()


{navigation_store, navigation_actions} = require '../boiler_plates/flux__boiler__plate__000__.coffee'





# import dispah and actions



keyboard_navigation_listeners = ->

    window.addEventListener 'keypress', (e)->
        c 'e', e

        switch e.key
            when 'ArrowDown', 'PageDown'
                e.preventDefault()
                c "got a keypress", e.key

            when " "
                e.preventDefault()
                c "got a spacebar"

            when "End"
                e.preventDefault()
                c "got End"

            when "Escape"
                c "got escape key"
                # want to let this continue acting as release from fullscreen but also should maybe show the onscreen
                # kind of HUD show keyboard shortcuts

            else

                c "got a keypress", e.key









module.exports = keyboard_navigation_listeners