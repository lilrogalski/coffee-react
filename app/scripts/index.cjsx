React = require 'react'
ReactDOM = require 'react-dom'

ShowList = require './comp/showlist'

HelloUser = React.createClass
  
  getInitialState: ->
    name: "Ryan Rogalski"
    friends: [
      "Alexa Wright",
      "George Parker",
      "Pat Marion"
    ]

  render: ->
    <div>
      <h3> Name: {this.state.name} </h3>
      <ShowList names={this.state.friends} />
    </div>


ReactDOM.render(
  <HelloUser name="Ryan" />,
  document.getElementById('app')
);