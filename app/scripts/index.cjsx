React = require 'react'
ReactDOM = require 'react-dom'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

App = React.createClass
  render: ->
    <div className="test">test div</div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);