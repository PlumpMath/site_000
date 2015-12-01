{c, React, Imm, rr, shortid, keys, assign, _, Bluebird, gl_mat, dispatcher, flux, EventEmitter} = require('../__boiler__plate__000__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

{navigation_actions} = require '../boiler_plates/flux__boiler__plate__000__.coffee'

mat3 = gl_mat.mat3
vec2 = gl_mat.vec2
vec3 = gl_mat.vec3

button = rr
    
    handle_click: ->
        navigation_actions.nav_to_001()

    render: ->
        M = @props.transform_matrix
        # c "button's M", M
        # scale_x = M[0][0]
        scale_x = M[0]
        # scale_y = M[1][1]
        scale_y = M[4]
        # in_origin = [-50, 50, 1]
        in_origin = [-50, 50, 1]
        in_side = 100
        # out_origin = mm M, in_origin
        # out_origin = mat3.mul mat3.create(), M, in_origin
        # out_origin = mat3.translate mat3.create(), M, in_origin
        # N = mat3.transpose mat3.create(), M
        out_origin = vec3.transformMat3 vec3.create(), in_origin, M
        # c 'out_origin', out_origin
        out_side = in_side * scale_x
        oo = {x: out_origin[0], y: out_origin[1]}
        {x, y} = oo

        svg
            width: '100%'
            height: '100%'
            defs
                radialGradient
                    id: "restart_grad_000"
                    stop
                        offset: "30%"
                        stopColor: 'lightgrey'
                    stop
                        offset:"70%"
                        stopColor: "yellow"
                    stop
                        offset:"95%"
                        stopColor:'#25eb92'
                filter
                    id: 'f_zero'
                    feGaussianBlur
                        in: "SourceGraphic"
                        result: "blurOut"
                        stdDeviation: 20
                    feOffset
                        in: "blurOut"
                        result: "dropBlur"
                        dx: 5
                        dy: 3



            rect
                x: x
                y: y
                width: out_side
                height: out_side
                opacity: .87
                fill: 'url(#restart_grad_000)'
                stroke: 'blue'
                onContextMenu: (e) -> e.preventDefault()
                onClick: @handle_click
                onMouseLeave: @handle_mouseleave
                onMouseOver: @handle_mouseover
            # text
            #     style:
            #         MozUserSelect: 'none'
            #     cursor: 'default'
            #     # onMouseOver: @handle_mouseover
            #     # onMouseLeave: @handle_mouseleave
            #     # onContextMenu: (e) -> e.preventDefault()
            #     # onClick: @handle_click
            #     x: text_origin_out[0] - ((r_001 * 4.82) / 4)
            #     y: text_origin_out[1] + ((r_001 * 2.4) / 3)
            #     fontSize: r_001 * 1.9

            #     fill: 'lightgreen'
            #     "⟲"
            # if @state?.tooltip is on
            #     g
            #         x: 0
            #         rect
            #             x: o_origin[0] - (o_side * .2)
            #             y: o_origin[1] - (o_side * .73) 
            #             width: o_side * 1.8
            #             height: o_side * .6
            #             fill: 'black'
            #             opacity: .47
            #         text
            #             style:
            #                 MozUserSelect: 'none'

            #             cursor: 'default'
            #             fontSize: r_001
            #             opacity: @state.text_opacity or 1
            #             fill: 'white'
            #             x: o_origin[0]
            #             y: o_origin[1] - o_side * .3
            #             "RESTART"

module.exports = -> button