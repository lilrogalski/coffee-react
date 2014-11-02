# @cjsx React.DOM

React = require 'react'
  
module.exports = React.createClass

  render: ->    
    commentNodes = @props.comments.map (comment) ->
      <Comment author={comment.author}>
        {comment.text}
      </Comment>

    <div className="commentList">
      {commentNodes}
    </div>
