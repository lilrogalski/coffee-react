# @cjsx React.DOM

React = require 'react'
CommentList = require './comments/commentList'
CommentForm = require './comments/commentForm'
  
module.exports = React.createClass

  render: ->    
    <div className="commentBox">
      <h1></h1>
        <CommentList />
        <CommentForm />
    </div>
