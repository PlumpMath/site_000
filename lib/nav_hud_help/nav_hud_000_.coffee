
# this element displays keyboard shortcuts.  we want the site to be fully navigable solely by keyboard actions in addition to the standard fare
# mouse and touchscreen navigation options  -- although until i have a touchscreen device to test on i can't really develop for touchscreen, so
# for now it's just mouse and keyobard navigation.  
# the listeners are in keyboard_navigation, loaded when the root component mounts., will need to be define the actionss in the 
# actions folder under the flux pattern.  

# i can think of three different options for the help nav hud thing.  1: hide all elements and display it using whole screen over black in white
# characters.  2: keep the underlying element active but maybe dim it, just put the hud over it.  might be less optimally readable depending on the color 
# matchups.  3: display hud info in the blackspace sidebars.



{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, i} = React.DOM

mat3 = gl_mat.mat3
vec3 = gl_mat.vec3


{navigation_actions, navigation_store} = require '../boiler_plates/flux__boiler__plate__000__.coffee'



nav_hud = rr

    componentDidMount: ->
        navigation_store.add_change_listener @on_change_000

    componentWillUnmount: ->
        navigation_store.remove_change_listener @on_change_000


    render: ->


        svg
            width: '100%'
            height: '100%'








module.exports = -> nav_hud