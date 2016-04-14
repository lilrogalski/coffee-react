React = require 'react'
ReactDOM = require 'react-dom'

App = React.createClass
  
  getInitialState: ->
    alert "in getInitialState"
    name: "Ryan Rogalski"

  componentWillMount: ->
    alert "in componentWillMount"

  componentDidMount: ->
    alert "in componentDidMount"

  componentWillReceiveProps: (nextProps) ->
    alert "in componentWillReceiveProps"

  componentWillUnmount: ->


  render: ->
    <div>
      <h3> Name: {@state.name} </h3>
    </div>


ReactDOM.render(
  <App />,
  document.getElementById('app')
);