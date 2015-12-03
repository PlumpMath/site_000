{c, React, Imm, rr, shortid, keys, assign, _, Bluebird, gl_mat, dispatcher, EventEmitter} = require('../__boiler__plate__000__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

{navigation_actions, navigation_store} = require '../boiler_plates/flux__boiler__plate__000__.coffee'

mat3 = gl_mat.mat3
vec2 = gl_mat.vec2
vec3 = gl_mat.vec3



fortune = rr
    
    handle_click: (e)->
        e.stopPropagation()
        c "have a click"
        # @props.action_fn()
        
    render: ->
        filter_000 = shortid()
        grad_000 = shortid()
        M = @props.M
        scale_x = M[0] ; scale_y = M[4]
        in_origin = [-100, 10, 1]
        in_vert_side = 20
        in_hori_side = 200
        out_origin = vec3.transformMat3 vec3.create(), in_origin, M
        out_vert_side = Math.abs(in_vert_side * scale_y)
        out_hori_side = Math.abs(in_hori_side * scale_x)
        x = out_origin[0] ; y = out_origin[1]

        svg
            width: '100%'
            height: '100%'
            onClick: @handle_click
            defs
                filter
                    id: filter_000
                    feGaussianBlur
                        in: "SourceGraphic"
                        result: "blurOut"
                        stdDeviation: 10
                    feOffset
                        in: "blurOut"
                        result: "dropBlur"
                        dx: 3
                        dy: 3
                linearGradient
                    id: grad_000
                    # x1: '20%'
                    # y1: '30%'
                    # x2: '40%'
                    # y2: '80%'
                    stop
                        offset: '0%'
                        # stopColor: 'hsl(88, 44%, 77%)'
                        stopColor: @props.stopColor_1
                    stop
                        offset: '32%'
                        # stopColor: 'hsl(130, 66%, 78%)'
                        stopColor: @props.stopColor_2
                    stop
                        offset:"98%"
                        # stopColor:"orange"
                        stopColor: @props.stopColor_3

            rect
                x: x
                y: y
                # width: out_hori_side
                # height: out_vert_side
                width: out_hori_side
                height: out_vert_side
                opacity: .67
                # fill: 'green'
                fill: "url(##{grad_000})"
                filter: "url(##{filter_000})"
                # stroke: 'blue'
                # onClick: @handle_click
                # onMouseLeave: @handle_mouseleave
                # onMouseOver: @handle_mouseover
                # onContextMenu: @onContextMenu
            text
                x: x + (out_hori_side / 10)
                y: y + (out_vert_side / 1.3)
                fontSize: out_vert_side / 1.3
                textLength: out_hori_side - (out_hori_side / 5)
                ,
                # "ideas"
                @props.text_content


module.exports = -> fortune