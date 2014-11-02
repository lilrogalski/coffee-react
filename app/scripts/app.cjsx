# @cjsx React.DOM

React = require 'react'
CommentList = require './comments/commentList'
CommentForm = require './comments/commentForm'
Comment = require './comments/comment'
  
module.exports = React.createClass

  loadCommentsFromServer: ->
    $.ajax
      url: @props.url
      dataType: "json"
      success: ((data) ->
        @setState data: data
      ).bind(this)
      error: ((xhr, status, err) ->
        console.error(@props.url, status, err.toString())
      ).bind(this)

  getInitialState: ->
    data: []

  componentDidMount: ->
    @loadCommentsFromServer()
    setInterval @loadCommentsFromServer, @props.pollInterval

  render: ->    
    <div className="commentBox">
      <h1>Comments</h1>
        <CommentList data={@state.data} />
        <CommentForm />
    </div>
