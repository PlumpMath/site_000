c = -> console.log.apply console, arguments

navigation_store = require '../stores/navigation_000_.coffee'
navigation_actions = require '../actions/navigation_000_.coffee'

flux =
    navigation_store: navigation_store
    navigation_actions: navigation_actions

module.exports = flux