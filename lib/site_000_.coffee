
document.getElementsByTagName('body')[0].style.overflow = 'hidden'
imp_root = document.getElementById('__react__root__')
imp_root.style.overflow = 'hidden'
require('./__monkey__patch__.coffee')
{c, React, Imm, rr, shortid, assign, keys, _, React_DOM, gl_mat, Bluebird, dispatcher, EventEmitter} = require('./__boiler__plate__000__.coffee')()
# note Todo modularise boilerplates for better organisation and 
# underssntanding of what can be removed

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

{navigation_store, navigation_actions} = require './boiler_plates/flux__boiler__plate__000__.coffee'

locations = require('./stores/navigation_000_.coffee').navigation_locations
# above could probably be folded into the flux boiler plate as well

exhibit_001 = require('./exhibits/exhibit_001_.coffee')()
exhibit_002 = require('./exhibits/exhibit_002_.coffee')()
exhibit_003 = require('./exhibits/exhibit_003_.coffee')()
button_000 = require('./buttons/button_000_.coffee')()
fortune_000 = require('./fortunes/fortune_000_.coffee')()
projects_map_000 = require('./exhibits/projects_map_000_.coffee')()

context_menu_000 = require('./custom_context_menus/nav_context_menu_000_.coffee')()

keyMirror = require ('react/lib/keyMirror')

mat3 = gl_mat.mat3
vec3 = gl_mat.vec3

# navigation = keyMirror
#     nav_001: null
#     nav_002: null
#     nav_003: null



main = rr
    # componentWillUpdate: (nextProps, nextState) ->
    #     @set_boundingRect
    payload_000: (square_side, view_width, view_height)->
        M_002 = [
            square_side, 0, 0,
            0, -square_side, 0,
            (view_width / 2), (view_height / 2), 1
        ]
        M: M_002
        imm_M: Imm.fromJS M_002

    payload_001: ->
        [
            @square_side, 0, 0,
            0, -@square_side, 0,
            (@state.view_width / 2), (@state.view_height / 2), 1
        ]

    inverse_payload_000: ->
        M = @payload_001()
        mat3.invert mat3.create(), M

    square_side: null

    mouse_location:
        x: null
        y: null

    handle_scroll: (e)->
        c "e.deltaX", e.deltaX
        c "e.deltaY", e.deltaY

    onContextMenu: (e) ->
        e.preventDefault()
        vec = vec3.transformMat3 vec3.create(), [e.pageX, e.pageY, 1], @inverse_payload_000()
        @mouse_location =
            x: vec[0]
            y: vec[1]
        
        navigation_actions.open_context_menu()
        # maybe i don't wan't to place the context menu all over the place
        # better just to have it in center translucent and big

    click_handle_000: (e)->
        c "if there's a context menu active, cancel it"
        navigation_actions.cancel_context_menu()

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
        context_state: navigation_store.get_context_state()

    on_nav_change_000: ->
        @setState
            current_location: navigation_store.get_current_location()
            context_state: navigation_store.get_context_state()

    nav_context_000_transform: (M)->
        scale_000 = .34
        translate_x = @mouse_location.x
        translate_y = @mouse_location.y
        in_transform_002 = [
            scale_000, 0, 0,
            0, scale_000, 0,
            translate_x, translate_y, 1
        ]
        mat3.multiply mat3.create(), M, in_transform_002

    render: ->

        get_spare_area_transform_000 = =>
            # so we have this wonderful black space which is nice 
            # as black space but even nicer if occasionally make use of it
            # usually it's going to be in the horizontal wings but it could 
            # be in vertical depending on browser window resizing.  
            # also it could be that if the browser window is resized square
            # the spare area is negligible and maybe won't be able to use
            # so we can catch that case if need be to prevent pointless use

            # assuming that the spare is in the horizontal:
            delta_000 = @state.view_width - @state.view_height

            rack_number = @state.view_height / spare_side

            # the floor of rack_number gives us number we can stack
            # the remainder gives us amount of space to work with as margins

            # plus we don't need to put squares in the margins they could
            # be 16:9 or something


            spare_M_000 = [ # this one would be on the left side right in middle
                spare_side, 0, 0,
                0, -spare_side, 0
                #this part is more complex because there will be a few 
                # slots we can translate to on either side.
                (delta_000 / 4), (@state.view_height / 2), 1
            ]


        M_003 = => [
                square_side, 0, 0,
                0, -square_side, 0,
                (@state.view_width / 2), (@state.view_height / 2), 1
            ]

        payload = =>
            M_002 = [
                square_side, 0, 0,
                0, -square_side, 0,
                (@state.view_width / 2), (@state.view_height / 2), 1
            ]
            M: M_002
            imm_M: Imm.fromJS M_002
            # from_root: on

        main_div = ->
            style:
                background: 'black'
                position: 'absolute'
                # width: window.innerWidth
                width: '100%'
                # height: window.innerHeight
                height: '100%'
                left: 0
                right: 0
                top: 0
                bottom: 0

        if not @state?.view_width
            div main_div(),
                h1 null, "..."
        else
            if @state.view_width < @state.view_height
                smaller = @state.view_width
                # spare = 'vertical'
            else
                smaller = @state.view_height
                # spare = 'horizontal'
                # so then the delta is 
                spare_side = (((@state.view_width - @state.view_height) / 2) / 200)
            @square_side = square_side = smaller / 200

            # i want to be able to use the leftover space whether it's 
            # vertical blackspace or horizontal blackspace.
            # also this funct may be better implemented

            div main_div(),
                # context_menu_000 payload()
                # fortune_000 payload()
                svg
                    width: '100%'
                    height: '100%'
                    display: 'block'
                    onContextMenu: @onContextMenu
                    onWheel: @handle_scroll
                    onClick: @click_handle_000
                ,
                    switch @state.current_location
                        when locations.projects_map_000
                            projects_map_000 payload()
                        when locations.nav_001
                            #exhibit_001 payload()
                            exhibit_001 @payload_000(square_side, @state.view_width, @state.view_height)
                        when locations.nav_002
                            exhibit_002 payload()
                        when locations.nav_003
                            exhibit_003 payload()
                    if @state.context_state
                        context_menu_000
                            M: @nav_context_000_transform(M_003())



                    # context_menu_000
                    #     M: get_spare_area_transform_000()

React_DOM.render main(), imp_root