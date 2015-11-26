{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

# c 'filter', filter


sketch = rr
    color_wheel: ->
        start = new Date().getTime()
        @combina = setInterval =>

            now = new Date().getTime()
            delta = now - start
            hue = (delta / 10) % 3600
            @setState
                stop_1: "hsl(#{hue}, 90%, 77%)"
                stop_2: "hsl(#{(hue + 120) % 360}, 90%, 77%)"
        , 100

    componentDidMount: ->
        @color_wheel()
    getInitialState: ->
        stop_1: 'red'
        stop_2: 'purple'
    render: ->
        M = @props.transform_matrix
        i_origin = [-100, 100, 1]
        i_side = 200
        o_origin = math.multiply M, i_origin ; o_side = i_side * M[0][0]
        f_zero_x = .5 * M[0][0]
        f_zero_y = .5 * M[1][1]
        std_dev = .9 * M[0][0]


        text_origin_in = [0, 0, 1]
        text_origin_out = math.multiply M, text_origin_in
        c 'text', text_origin_out
        r_000 = 60
        r_001 = M[0][0] * r_000

        # h1 {style:{color: 'white'}}, "helelo"


        svg
            width: '100%'
            height: '100%'
            defs
                radialGradient
                    id: "six_grad_000"
                    stop
                        offset: "30%"
                        stopColor: 'lightgrey'
                    stop
                        offset:"70%"
                        stopColor: @state.stop_1
                    stop
                        offset:"95%"
                        stopColor:@state.stop_2
                # at present (November 23, 2015), some attributes are missing from 
                # react and our monkey patch no working with react v 0.14.3 whereas
                # it worked with the beta.  
                # according to this thread issue https://github.com/facebook/react/issues/1657
                # comment by spicy whatever (7 days ago) it will be fixed soon
                # also zpao (see comment) said some interesting things
                # in the meantime just ignore it and don't use the complaining things.
                
                # filter #DONT USE FILTER UNTIL THEY FIX SVG ^^ see thread issue

            rect
                x: o_origin[0]
                y: o_origin[1]
                # x: 100
                # y: 100
                width: o_side
                height: o_side

                # filter: 'url(#f_zero)'
                fill: 'hsl(33,99%,99%)'
                # onContextMenu: @props.onContextMenu
                # onClick: @props.onClick

            rect
                x: o_origin[0]
                y: o_origin[1]
                width: o_side
                height: o_side
                # fill: 'url(#rGrad_000)'
                fill: 'hsl(33,99%,99%)'
                opacity: .87
                filter: 'url(#f1)'
                fill: 'url(#six_grad_000)'
                stroke: 'blue'
                # onContextMenu: @props.onContextMenu
                # onClick: @props.onClick
            # text
            #     x: text_origin_out[0] - ((r_001 * .9) / 4)
            #     y: text_origin_out[1] + ((r_001 * .9) / 3)
            #     fontSize: r_001 * .9
            #     6








module.exports = -> sketch