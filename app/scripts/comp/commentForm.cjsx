React = require 'react'

module.exports = React.createClass
  
  getInitialState: ->
    author: ''
    text: ''

  handleAuthorChange: (e) ->
    @setState
      author: e.target.value

  handleTextChange: (e) ->
    @setState
      text: e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    author = @state.author.trim()
    text = @state.text.trim()

    if (!text or !author)
      return

    @props.onCommentSubmit
      author: author 
      text: text 
      
    @setState
      author: ''
      text: ''

  render: ->
    <form className="commentForm" onSubmit={@handleSubmit}>
      <input 
        type="text" 
        placeholder="Your name" 
        value={@state.author}
        onChange={@handleAuthorChange}
      />
      <input 
        type="text" 
        placeholder="Say something..." 
        value={@state.text}
        onChange={@handleTextChange}
      />
      <input type="submit" value="Post" />    
    </form>
