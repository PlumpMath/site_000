{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird} = require('../__boiler__plate__000__.coffee')()
c "hey"
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

sketch = rr
        M = @props.transform_matrix

        i_origin = [-100, 100, 1]
        i_side = 200

        o_origin = math.multiply M, i_origin ; o_side = i_side * M[0][0]

        f1_x = .5 * M[0][0]
        f1_y = .5 * M[1][1]
        std_dev = .9 * M[0][0]


        svg
            width: '100%'
            height: '100%'
            defs
                radialGradient
                    id: "rGrad_001"
                    stop
                        offset: "30%"
                        stopColor: 'lightgrey'
                    stop
                        offset:"70%"
                        stopColor: "blue"
                    stop
                        offset:"95%"
                        stopColor:"lightblue"
                filter
                    id: 'f1'
                    feGaussianBlur
                        in: "SourceGraphic"
                        result: "blurOut"
                        stdDeviation: std_dev
                    feOffset
                        in: "blurOut"
                        result: "dropBlur"
                        dx: f1_x
                        dy: f1_y

            rect
                x: o_origin[0]
                y: o_origin[1]
                width: o_side
                height: o_side
                #fill: 'url(#rGrad_000)'
                
                filter: 'url(#f1)'
                fill: 'hsl(33,99%,99%)'
                onContextMenu: @props.onContextMenu
                onClick: @props.onClick

            rect
                x: o_origin[0]
                y: o_origin[1]
                width: o_side
                height: o_side
                #fill: 'url(#rGrad_000)'
                opacity: .87
                #filter: 'url(#f1)'
                fill: 'url(#rGrad_001)'
                stroke: 'blue'
                onContextMenu: @props.onContextMenu
                onClick: @props.onClick

module.exports = -> sketch