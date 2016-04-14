React = require 'react'
ReactDOM = require 'react-dom'

ShowList = require './comp/showlist'
AddFriend = require './comp/addfriend'

App = React.createClass
  
  getInitialState: ->
    name: "Ryan Rogalski"
    friends: [
      "Alexa Wright",
      "George Parker",
      "Pat Marion"
    ]

  addFriend: (friend) ->
    @setState 
      friends: @state.friends.concat friend

  render: ->
    <div>
      <h3> Name: {@state.name} </h3>
      <AddFriend addNew={@addFriend} />
      <ShowList names={@state.friends} />
    </div>


ReactDOM.render(
  <App />,
  document.getElementById('app')
);