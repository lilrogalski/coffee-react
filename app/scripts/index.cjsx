React = require 'react'
ReactDOM = require 'react-dom'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

App = React.createClass
  render: ->
    <div className="vertical-center-wrap">
      <div className="vertical-center-item">some text
      </div>
    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);