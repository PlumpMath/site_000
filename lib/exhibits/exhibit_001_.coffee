{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, i} = React.DOM

button_000 = require('../buttons/button_000_.coffee')()

dragoon_store = require('../stores/dragoon_store_000_.coffee')



exhibit = rr

    handle_000: ->
        dispatcher.dispatch
            myType: 'hello type 0'
            type: 'hello type 1'
            some_other_property: 'another property'

    button_000_transform: ->
        M = @props.transform_matrix
        scale_x = M[0][0]
        scale_000 = .05
        translate_x = 95
        translate_y = -95
        in_transform = [
            [scale_000, 0, translate_x],
            [0, scale_000, translate_y],
            [0, 0, 1]
        ]
        mm M, in_transform

    render: ->

        M = @props.transform_matrix
        scale_x = M[0][0]
        scale_y = M[1][1]
        in_origin = [-98, 98, 1]
        in_side = 196
        out_origin = mm M, in_origin
        out_side = in_side * M[0][0]
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
                        stopColor: 'hsl(33, 44%, 77%)'
                    stop
                        offset: '92%'
                        stopColor: 'hsl(70, 66%, 78%)'
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
                        onMouseOver: @handle_000
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