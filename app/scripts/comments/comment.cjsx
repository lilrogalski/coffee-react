# @cjsx React.DOM

React = require 'react'

module.exports = React.createClass

  render: ->
    <div className='comment'>
      <strong>{@props.comment.author}</strong>
      {@props.comment.text}
    </div>