React = require 'react'
ReactDOM = require 'react-dom'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

style: 
  textShadow: "0 1px 1px black"
  fontSize: "40px"
  fontFamily: "Avenir"

App = React.createClass

  getInitialState: ->
    mouseX: ''

  onMouseMove: (e) ->
    @setState mouseX: e.clientX, mouseY: e.clientY



  render: ->
    <div 
      className="vertical-center-wrap"
      onMouseMove={@onMouseMove}>

      <div className="vertical-center-item" styles={@style}>{@state.mouseX},{@state.mouseY}</div>
        
    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);