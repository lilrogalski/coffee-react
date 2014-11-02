# @cjsx React.DOM

React = require 'react'
  
module.exports = React.createClass
  commentNodes = @props.comments.map (comment) ->
    <Comment author={comment.author}>
      {comment.text}
    </Comment>

  render: ->    
    <div className="commentList">
      {commentNodes}
    </div>
