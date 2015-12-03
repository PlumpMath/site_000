{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, i} = React.DOM

blake = (fsize) ->

    p
        style:
            fontSize: fsize
        mouseOver: -> c 'got something'
        ,
        "testing testing one two three"


module.exports = blake