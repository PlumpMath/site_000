#----------------------------------------------
# monkey patch from
# https://gist.github.com/akre54/80eaa63762ea499029f0
#works with react v0.14.0-beta1 , not with v0.14.3
# works, just not with webpack react-hot-loader, because for some reason it's 
# not getting react version dependency right . this works only for `webpack` standalone
c = -> console.log.apply console, arguments

ReactDOM = require 'react/lib/ReactDOM'
ReactElement = require 'react/lib/ReactElement'
ReactElementValidator = require 'react/lib/ReactElementValidator'
SVGDOMPropertyConfig = require 'react/lib/SVGDOMPropertyConfig'
DOMProperty = require 'react/lib/DOMProperty'
MUST_USE_ATTRIBUTE = DOMProperty.injection.MUST_USE_ATTRIBUTE

createFactory = if __DEV__?
    ReactElementValidator.createFactory
  else
    ReactElement.createFactory

SVGDOMPropertyConfig.Properties.mask = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.filter = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.stdDeviation = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.result = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.mode = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.in = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.in2 = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.x = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.y = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.rx = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.ry = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.dx = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.dy = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.cursor = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.textLength = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.lengthAdjust = MUST_USE_ATTRIBUTE


ReactDOM.filter = createFactory 'filter'
ReactDOM.feGaussianBlur = createFactory 'feGaussianBlur'
ReactDOM.feBlend = createFactory 'feBlend'
ReactDOM.feOffset = createFactory 'feOffset'
ReactDOM.feMerge = createFactory 'feMerge'
ReactDOM.feMergeNode = createFactory 'feMergeNode'
ReactDOM.foreignObject = createFactory 'foreignObject'