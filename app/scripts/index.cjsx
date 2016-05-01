React = require 'react'
ReactDOM = require 'react-dom'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

App = React.createClass
  
  getInitialState: ->
    mouseX: ''
    mouseY: ''
    style: 
      textShadow: "0 10px 10px 10px black"


  onMouseMove: (e) ->
    posX = (window.innerWidth / 2) - e.clientX 
    posY = (window.innerHeight / 2) - e.clientY
    color = "#616161"

    @setState 
      style:
        textShadow: "#{posX/144}px #{posY/144}px #{10}px #{color},
                    #{posX/89}px #{posY/89}px #{10*1.1}px #{color},
                    #{posX/55}px #{posY/55}px #{10*1.2}px #{color},
                    #{posX/34}px #{posY/34}px #{10*1.3}px #{color},
                    #{posX/21}px #{posY/21}px #{10*1.4}px #{color},
                    #{posX/13}px #{posY/13}px #{10*1.5}px #{color},
                    #{posX/8}px #{posY/8}px #{10*1.6}px #{color},
                    #{posX/5}px #{posY/5}px #{10*1.7}px #{color},
                    #{posX/3}px #{posY/3}px #{10*1.8}px #{color},
                    #{posX/2}px #{posY/2}px #{10*1.9}px #{color}"


  render: ->
    <div 
      className="vertical-center-wrap"
      onMouseMove={@onMouseMove}>

      <div className="vertical-center-item" style={@state.style}>TEXT SHADOW</div>
        
    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);