# a deck presents a bunch of cards.  cards are 
# previews for exhibits.  exhibits are like pages, 
# documents, or presentations; designed to take 
# all attention to one thing. 

{c, React, Imm, rr, shortid, keys, assign, math, _, Bluebird, gl_mat, dispatcher, flux, mm, EventEmitter} = require('../__boiler__plate__000__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

card_000 = require('../cards/card_000_.coffee')()
deep_blue_000 = require('../cards/deep_blue_000_.coffee')()
projects_000 = require('../cards/projects_000_.coffee')()
card_001 = require('../cards/card_001_.coffee')()

deck = rr
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

        common_card_scale = .3

        tr_local_001 = (x_trans, y_trans)=>
            [
                [common_card_scale, 0, x_trans],
                [0, common_card_scale, y_trans],
                [0, 0, 1]
            ]
        payload_002 = (x_trans, y_trans) =>
            transform_matrix: mm M, tr_local_001(x_trans, y_trans)

        payload_003 = (x_trans, y_trans, text_content) =>
            transform_matrix: mm M, tr_local_001(x_trans, y_trans)
            text_content: text_content


        svg
            width: '100%'
            height: '100%'

            deep_blue_000 payload_002(-40, -40)
            # card_000 payload_002(40, 40)
            card_001 payload_003(40, 40, 'card_001')
            projects_000 payload_002(-40, 40)







module.exports = -> deck