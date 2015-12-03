{c, React, Imm, rr, shortid, keys, assign, _, Bluebird, gl_mat, dispatcher, flux, EventEmitter} = require('../__boiler__plate__000__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

{navigation_actions} = require '../boiler_plates/flux__boiler__plate__000__.coffee'

fortune_000 = require('../fortunes/fortune_000_.coffee')()

mat3 = gl_mat.mat3
vec2 = gl_mat.vec2
vec3 = gl_mat.vec3

navi_context_menu = rr

    fortune_000_transform: ->
        scale_000 = 1
        translate_x = 0
        translate_y = 36
        in_transform_002 = [
            scale_000, 0, 0,
            0, scale_000, 0,
            translate_x, translate_y, 1
        ]
        # M_001 =  @props.imm_M.toJS()
        M_001 = @props.M
        mat3.multiply mat3.create(), M_001, in_transform_002

    fortune_transform_001: (trans_x, trans_y) ->
        scale_000 = 1
        translate_x = trans_x
        translate_y = trans_y
        in_transform_002 = [
            scale_000, 0, 0,
            0, scale_000, 0,
            translate_x, translate_y, 1
        ]
        # M_001 =  @props.imm_M.toJS()
        M_001 = @props.M
        mat3.multiply mat3.create(), M_001, in_transform_002

    render: ->
        M = @props.M
        scale_x = M[0] ; scale_y = M[4]
        in_origin = [-100, 100, 1]
        in_side = 200
        out_origin = vec3.transformMat3 vec3.create(), in_origin, M
        out_side = in_side * scale_x
        x = out_origin[0] ; y = out_origin[1]

        svg
            width: '100%'
            height: '100%'

            rect
                x: x
                y: y
                width: out_side
                height: out_side
                fill: 'white'
                opacity: .67
                # stroke: 'blue'
            fortune_000
                M: @fortune_000_transform()
                text_content: 'ideas'
                stopColor_1: 'hsl(220, 65%, 77%)'
                stopColor_2: 'hsl(225, 77%, 57%)'
                stopColor_3: 'hsl(300, 63%, 77%)'
            fortune_000
                M: @fortune_transform_001(0, 80)
                text_content: 'projects'
                stopColor_1: 'hsl(220, 65%, 77%)'
                stopColor_2: 'hsl(225, 77%, 57%)'
                stopColor_3: 'hsl(300, 63%, 77%)'
            fortune_000
                M: @fortune_transform_001(0, -80)
                text_content: 'fortune 000'
                stopColor_1: 'hsl(220, 65%, 77%)'
                stopColor_2: 'hsl(225, 77%, 57%)'
                stopColor_3: 'hsl(300, 63%, 77%)'


module.exports = -> navi_context_menu