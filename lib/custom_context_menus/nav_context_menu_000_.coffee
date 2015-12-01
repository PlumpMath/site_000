{c, React, Imm, rr, shortid, keys, assign, _, Bluebird, gl_mat, dispatcher, flux, EventEmitter} = require('../__boiler__plate__000__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

{navigation_actions} = require '../boiler_plates/flux__boiler__plate__000__.coffee'

mat3 = gl_mat.mat3
vec2 = gl_mat.vec2
vec3 = gl_mat.vec3

navi_context_menu = rr


    render: ->
        svg
            width: '100%'
            height: '100%'

            rect
                x: x
                y: y
                width: 50
                height: 50
                opacity: .87
                stroke: 'blue'

module.exports = -> navi_context_menu