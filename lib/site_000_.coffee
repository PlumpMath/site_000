
document.getElementsByTagName('body')[0].style.overflow = 'hidden'
imp_root = document.getElementById('__react__root__')
imp_root.style.overflow = 'hidden'
require('./__monkey__patch__.coffee')
{c, React, Imm, rr, shortid, assign, keys, _, React_DOM, gl_mat, Bluebird, dispatcher, EventEmitter} = require('./__boiler__plate__000__.coffee')()
# note Todo modularise boilerplates for better organisation and 
# underssntanding of what can be removed

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

{navigation_store, navigation_actions} = require './boiler_plates/flux__boiler__plate__000__.coffee'

exhibit_001 = require('./exhibits/exhibit_001_.coffee')()
exhibit_002 = require('./exhibits/exhibit_002_.coffee')()
button_000 = require('./buttons/button_000_.coffee')()

keyMirror = require ('react/lib/keyMirror')

navigation = keyMirror
    nav_001: null
    nav_002: null

main = rr
    # componentWillUpdate: (nextProps, nextState) ->
    #     @set_boundingRect

    onContextMenu: (e) ->
        e.preventDefault()
        c 'here'

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
        navigation_store.add_change_listener @on_nav_change_000
    componentWillUnmount: ->
        navigation_store.remove_change_listener @on_nav_change_000
    getInitialState: ->
        current_location: navigation_store.get_current_location()

    on_nav_change_000: ->
        @setState
            current_location: navigation_store.get_current_location()
    render: ->

        payload = =>
            M_002 = [
                z, 0, 0,
                0, -z, 0,
                (@state.view_width / 2), (@state.view_height / 2), 1
            ]
            imm_M: Imm.fromJS M_002
            # from_root: on

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
                h1 null, "..."
        else
            smaller = if @state.view_width < @state.view_height then @state.view_width else @state.view_height
            z = smaller / 200
            div main_div(),
                switch @state.current_location
                    when navigation.nav_001
                        exhibit_001 payload()
                    when navigation.nav_002
                        exhibit_002 payload()


React_DOM.render main(), imp_root