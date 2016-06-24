React = require 'react'
ReactDOM = require 'react-dom'
Animate = require 'react-addons-css-transition-group'

App = React.createClass
  
  render: ->
    <div className="vc-wrap">
      <div className="vc-item">
        Welcome to React
      </div>
    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);