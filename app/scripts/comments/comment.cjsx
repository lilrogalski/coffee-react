# @cjsx React.DOM

React = require 'react'
  
module.exports = React.createClass

  render: ->    
    @props.comments.map (comment) ->
      <Comment author={comment.author}>
        {comment.text}
      </Comment>
