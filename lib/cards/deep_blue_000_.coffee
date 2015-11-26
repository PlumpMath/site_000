{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM


card = rr

    render: ->
        M = @props.transform_matrix
        scale_x = M[0][0]
        scale_y = M[1][1]
        in_origin = [-70, 70, 1]
        in_side = 140
        out_origin = mm M, in_origin
        out_side = in_side * M[0][0]
        f_zero_x = .5 * scale_x
        f_zero_y = .5 * scale_y
        std_dev = .9 * scale_x
        oo = {x: out_origin[0], y: out_origin[1]}



        {x, y} = oo
        svg
            width: '100%'
            height: '100%'
            rect
                x: out_origin[0]
                y: out_origin[1]
                width: out_side
                height: out_side
                fill: 'hsl(250, 99%, 49%)'
            t_x = x + (out_side / 6)
            t_y = y + (out_side / 1.8)
            text
                x: t_x
                y: t_y
                fontSize: 20 * scale_x
                # 'עברית'
                'deep blue'





module.exports = -> card