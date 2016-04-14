React = require 'react'

module.exports = React.createClass 
  render: ->
    <tr><th colSpan="2">{@props.category}</th></tr>

  