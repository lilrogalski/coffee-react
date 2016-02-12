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
    author = this.state.author.trim()
    text = this.state.text.trim()
    if (!text || !author) 
      return

    @setState(
      author: ''
      text: ''
      )

  render: ->    
    <form className="commentForm" onSubmit={this.handleSubmit}>
      <input
        type="text"
        placeholder="Your name"
        value={this.state.author}
        onChange={this.handleAuthorChange}
      />
      <input
        type="text"
        placeholder="Say something..."
        value={this.state.text}
        onChange={this.handleTextChange}
      />
      <input type="submit" value="Post" />
    </form>