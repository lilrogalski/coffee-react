# @cjsx React.DOM

React = require 'react'
CommentList = require './comments/commentList'
CommentForm = require './comments/commentForm'
Comment = require './comments/comment'
data = require './data.coffee'

module.exports = React.createClass
  
  render: ->
    <div className="container">
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={data} />
        <CommentForm />
      </div>
    </div>
