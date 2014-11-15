# @cjsx React.DOM

React = require 'react'
CommentList = require './comments/commentList'
CommentForm = require './comments/commentForm'
Comment = require './comments/comment'
TodoList = require './todoList'

module.exports = React.createClass

  getInitialState: ->
    items: []
    text: ''
  
  onChange: (e) ->
    @setState({text: e.target.value})
  
  handleSubmit: (e) ->
    e.preventDefault()
    nextItems = @state.items.concat([@state.text])
    nextText = ''
    @setState({items: nextItems, text: nextText})
  
  render: ->
    <div>
      <h3>TODO</h3>
      <TodoList items={@state.items} />
      <form onSubmit={@handleSubmit}>
        <input onChange={@onChange} value={@state.text} />
        <button>{'Add #' + (@state.items.length + 1)}</button>
      </form>
    </div>
