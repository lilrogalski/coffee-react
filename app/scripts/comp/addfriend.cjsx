React = require 'react'

module.exports = React.createClass 

  getInitialState: ->
    newFriend: ''

  updateNewFriend: (e) ->
    @setState 
      newFriend: e.target.value

  handleAddNew: ->
    @props.addNew @state.newFriend
    @setState
      newFriend: ''

  render: ->
    <div>
      <input type="text" value={@state.newFriend} onChange={@updateNewFriend} />
      <button onClick={@handleAddNew}>Add Friend</button>
    </div>
