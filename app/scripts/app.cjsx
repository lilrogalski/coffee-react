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
    <div className="container">
      <div className="col-sm-6 col-sm-push-3">
        <h3>TODO</h3>
        <TodoList items={@state.items} />
        <form onSubmit={@handleSubmit}>
          <div className="input-group">
            <input type="text" className="form-control" placeholder="Add an item" onChange={@onChange} value={@state.text}/>
            <span className="input-group-btn">
              <button className="btn btn-default" type="button">{'Add #' + (@state.items.length + 1)}</button>
            </span>
          </div>
        </form>
      </div>
    </div>

