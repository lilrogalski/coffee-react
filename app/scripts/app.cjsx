# @cjsx React.DOM

React = require 'react'
CommentList = require './comments/commentList'
CommentForm = require './comments/commentForm'
Comment = require './comments/comment'
CommentBox = require './comments/commentBox'

module.exports = React.createClass

  render: ->
    <div className="container">
      <CommentBox url="/api/comments" pollInterval={2000} />
    </div>
