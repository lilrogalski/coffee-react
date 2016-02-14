React = require 'react'
ReactDOM = require 'react-dom'

CommentList = require "./commentList"
CommentForm = require "./commentForm"

module.exports = React.createClass

  render: ->
    <div className="commentBox container">
      <h1>Comments</h1>
      <CommentList data={@props.data}/>
      <CommentForm />
    </div>
