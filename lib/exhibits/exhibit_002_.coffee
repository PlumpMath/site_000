{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, i} = React.DOM

mat3 = gl_mat.mat3
vec3 = gl_mat.vec3
# c 'mat3', mat3

button_000 = require('../buttons/button_000_.coffee')()

{navigation_actions, navigation_store} = require '../boiler_plates/flux__boiler__plate__000__.coffee'

exhibit = rr

    get_state_from_dragoon_000: ->
        navigation_store.test_000()
        red: 'red'
        white: 'gold'

    on_change_000: ->

        @setState @get_state_from_dragoon_000()

    componentDidMount: ->
        navigation_store.add_change_listener @on_change_000

    handle_002: ->
        navigation_actions.nav_to_001()

    button_000_transform: ->
        scale_000 = .05
        translate_x = 95.0
        translate_y = -95.0
        in_transform_002 = [
            scale_000, 0, 0,
            0, scale_000, 0,
            translate_x, translate_y, 1
        ]
        M_001 =  @props.imm_M.toJS()
        ret_001 = mat3.multiply mat3.create(), M_001, in_transform_002
        return ret_001

    render: ->
        M_001 = @props.imm_M.toJS()
        scale_x = M_001[0]
        scale_y = M_001[4]
        in_origin = [-98, 98, 1]
        in_side = 196
        out_origin = vec3.transformMat3 vec3.create(), in_origin, M_001
        out_side = in_side * scale_x
        f_zero_x = .5 * scale_x
        f_zero_y = .5 * scale_y
        std_dev = .9 * scale_x
        oo = {x: out_origin[0], y: out_origin[1]}
        grad_000 = shortid() ; filter_000 = shortid()
        {x, y} = oo

        svg
            width: '100%'
            height: '100%'
            defs
                filter
                    id: filter_000
                    feGaussianBlur
                        in: "SourceGraphic"
                        result: "blurOut"
                        stdDeviation: std_dev
                    feOffset
                        in: "blurOut"
                        result: "dropBlur"
                        dx: f_zero_x
                        dy: f_zero_y
                linearGradient
                    id: grad_000
                    # x1: '20%'
                    # y1: '30%'
                    # x2: '40%'
                    # y2: '80%'
                    stop
                        offset: '0%'
                        stopColor: 'hsl(88, 44%, 77%)'
                    stop
                        offset: '92%'
                        stopColor: 'hsl(130, 66%, 78%)'
                    # stop
                    #     offset:"98%"
                    #     stopColor:"orange"
            rect
                x: x
                y: y
                width: out_side
                height: out_side
                # fill: 'hsl(250, 99%, 49%)'
                fill: "url(##{grad_000})"
                filter: "url(##{filter_000})"
                # filter: 'url(#f_zero)'

            foreignObject
                x: x + (scale_x * 4.5)
                y: y + (scale_y * .5)
                width: out_side - (scale_x * 10)
                height: out_side - (scale_y * 10)
                p
                    style:
                        fontSize: scale_x * 3,
                    "hello, and this and that and the other thing and a
all of that javzz and looking for a word wrap and that. 
So how much of a word wrap can we expect and how effectively will SVG handle html elements for the purposes of typesetting inside
SVG elements is like are things we are trying to figure out here. "
                    i null, "helloosnthausnteh"
                    span
                        onMouseOver: @handle_002
                        ,
                        " it works just fine.
It works exceedingly well actually"
                p
                    style:
                        fontSize: scale_x * 3,
                    "Here another paragraph.
And another going by.  And another checking margins,"
                h3
                    style:
                        textAlign: 'center'
                        fontSize: scale_x * 3,
                    "
And a Heading"
        
                p
                    style:
                        fontSize: scale_x * 3,
                    "
This is another paragraph.
And it's not so bad for writing. 






"


        

            button_000
                transform_matrix: @button_000_transform()








module.exports = -> exhibit