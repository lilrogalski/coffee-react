# @cjsx React.DOM

React = require 'react'
CommentList = require './comments/commentList'
CommentForm = require './comments/commentForm'
Comment = require './comments/comment'
  
module.exports = React.createClass

  render: ->    
    <div className="commentBox">
      <h1></h1>
        <CommentList comments={@props.comments} />
        <CommentForm />
    </div>
