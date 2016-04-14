React = require 'react'
ReactDOM = require 'react-dom'

HelloUser = React.createClass
  getInitialState: ->
    username: '@ryan'

  handleChange: (e) ->
    @setState
      username: e.target.value

  render: ->
    <div>
      Hello {@state.username} <br />
      Change name: <input type="text" value={@state.username} onChange={@handleChange}/>
    </div>


ReactDOM.render(
  <HelloUser />,
  document.getElementById('app')
);