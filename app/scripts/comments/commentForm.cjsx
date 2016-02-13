# @cjsx React.DOM
React = require 'react'
  
module.exports = React.createClass
  
  getInitialState: ->
    author: ''
    text: ''
  
  handleAuthorChange: (e) ->
    @setState({author: e.target.value})
  
  handleTextChange: (e) ->
    @setState({text: e.target.value})

  handleSubmit: (e) ->
    e.preventDefault()
    author = @state.author.trim()
    text = @state.text.trim()
    if (!text || !author) 
      return

    @props.onCommentSubmit
      author: author
      text: text

    @setState
      author: ''
      text: ''
      

  render: ->    
    <form className="commentForm" onSubmit={@handleSubmit}>
      <p>Add a new Comment</p>
      <div className="form-group">
        <input
          className="form-control"
          type="text"
          placeholder="Your name"
          value={@state.author}
          onChange={@handleAuthorChange}
        />
      </div>
      <div className="form-group">
        <input
          className="form-control"
          type="text"
          placeholder="Say something..."
          value={@state.text}
          onChange={@handleTextChange}
        />
      </div>
      <input type="submit" value="Post" className="btn btn-default" />
    </form>