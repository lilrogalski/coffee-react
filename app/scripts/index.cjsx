React = require 'react'
ReactDOM = require 'react-dom'

HelloUser = React.createClass
  getInitialState: ->
    username: '@ryan'

  render: ->
    <div>
      Hello {@state.username}
    </div>


ReactDOM.render(
  <HelloUser />,
  document.getElementById('app')
);