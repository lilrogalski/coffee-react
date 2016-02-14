React = require 'react'
ReactDOM = require 'react-dom'

CommentList = require "./commentList"
CommentForm = require "./commentForm"

module.exports = React.createClass
  
  loadCommentsFromServer: ->
    $.ajax
      url: @props.url
      dataType: 'json'
      cache: false

      success: ((data) ->
        @setState
          data: data
      ).bind(@)

      error: ((xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(@)

  handleCommentSubmit: (comment) ->
    comments = @state.data 
    comment.id = Date.now()
    newComments = comments.concat([comment])
    @setState
      data: newComments

    $.ajax
      url: @props.url
      dataType: 'json'
      type: 'POST'
      data: comment

      success: ((data) ->
        @setState
          data: data
      ).bind(@)

      error: ((xhr, status, err) ->
        @setState 
          data: comments
        console.error @props.url, status, err.toString()
      ).bind(@)

  getInitialState: ->
    data: []

  componentDidMount: ->
    @loadCommentsFromServer
    setInterval @loadCommentsFromServer, @props.pollInterval

  render: ->
    <div className="commentBox container">
      <h1>Comments</h1>
      <CommentList data={@state.data}/>
      <CommentForm onCommentSubmit={@handleCommentSubmit}/>
    </div>
