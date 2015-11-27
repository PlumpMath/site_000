
document.getElementsByTagName('body')[0].style.overflow = 'hidden'
imp_root = document.getElementById('__react__root__')
imp_root.style.overflow = 'hidden'
require('./__monkey__patch__.coffee')
{c, React, Imm, rr, shortid, assign, keys, math, _, React_DOM, mm, gl_mat, Bluebird, flux, dispatcher, EventEmitter} = require('./__boiler__plate__000__.coffee')()
# note Todo modularise boilerplates for better organisation and 
# underssntanding of what can be removed

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

# sketch_000 = require('./pad/sketch_000_.coffee')()
# sketch_001 = require('./pad/sketch_001_.coffee')()

card_000 = require('./cards/card_000_.coffee')()
deep_blue_000 = require('./cards/deep_blue_000_.coffee')()
deck_000 = require('./decks/deck_000_.coffee')()

exhibit_000 = require('./exhibits/exhibit_000_.coffee')()
exhibit_001 = require('./exhibits/exhibit_001_.coffee')()
button_000 = require('./buttons/button_000_.coffee')()

main = rr
    # componentWillUpdate: (nextProps, nextState) ->
    #     @set_boundingRect
    componentWillUnmount: ->
        window.onresize = null
    set_boundingRect: ->
        @forceUpdate()
        bounding_rect = React_DOM.findDOMNode(@).getBoundingClientRect()
        @setState
            view_width: bounding_rect.width
            view_height: bounding_rect.height
            x: bounding_rect.width / 2 # transform coordinate system
            y: bounding_rect.height / 2 # translation of coordinate

    debounce: (func, wait, immediate) ->
        timeout = 'scoped here'
        ->
            context = @
            args = arguments
            later = ->
                timeout = null
                if not(immediate) then func.apply(context, args)
            callNow = immediate and not(timeout)
            clearTimeout(timeout)
            timeout = setTimeout(later, wait)
            if callNow then func.apply(context, args)
    debounced_set_boundingRect: -> @debounce(@set_boundingRect, 500)()
    componentDidMount: ->
        @set_boundingRect()
        window.onresize = @debounced_set_boundingRect
        #window.onresize = @set_boundingRect

    render: ->
        payload = =>
            transform_matrix: [[z, 0, (@state.view_width / 2)],[0, -z, (@state.view_height / 2)],[0, 0, 1]]
            from_root: on

        main_div = ->
            style:
                background: 'black'
                position: 'absolute'
                width: window.innerWidth
                height: window.innerHeight
                left: 0
                right: 0
                top: 0
                bottom: 0

        if not @state?.view_width
            div main_div(),
                h1 null, "Hellososo"
        else
            smaller = if @state.view_width < @state.view_height then @state.view_width else @state.view_height
            z = smaller / 200
            div main_div(),
                # h1 {style:{color:'white'}}, "Hello"
                # sketch_000 payload()

                # card_000 payload()
                #sketch_001 payload()
                # deep_blue_000 payload()
                # deck_000 payload()
                exhibit_001 payload()
                # button_000 payload()




React_DOM.render main(), imp_root