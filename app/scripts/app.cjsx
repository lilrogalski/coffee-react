# @cjsx React.DOM

React = require 'react'
demoComponent = require './components/demoComponent'

module.exports = React.createClass

  render: ->
    <div className="container">
      <demoComponent />
    </div>
