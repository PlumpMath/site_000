c = -> console.log.apply console, arguments
React = require 'react'
React_DOM = require 'react-dom'
Immutable = require 'immutable'
_ = require 'lodash'
Bluebird = require 'bluebird'
math = require './math.min.js'
flux = require 'flux'
Dispatcher = flux.Dispatcher
dispatcher = new Dispatcher()
EventEmitter = require('events').EventEmitter
gl_mat = require 'gl-matrix'
shortid = require 'shortid'

module.exports = ->
    EventEmitter: EventEmitter
    dispatcher: dispatcher
    flux: flux
    _: _
    React: React
    React_DOM: React_DOM
    rr: -> React.createFactory(React.createClass.apply(React, arguments))
    c : -> console.log.apply console, arguments
    Imm: Immutable
    Bluebird: Bluebird
    shortid: shortid
    assign: -> _.assign.apply(_, arguments)
    keys: -> _.keys.apply(_, arguments)
    math: math
    gl_mat: gl_mat
    mm: -> math.multiply.apply math, arguments

    # maybe remove the binding to lodash back to native ES6 if 
    # browser compat changed for the better since summer 2015
