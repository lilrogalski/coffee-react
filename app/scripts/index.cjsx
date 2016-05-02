React = require 'react'
ReactDOM = require 'react-dom'

App = React.createClass

  buildShadow: (posX, posY) ->
    multiplier = 50
    shadow = []    
    for i in [0..multiplier]
      shadow.push  "#{(posX * i) / multiplier}px #{(posY * i) / multiplier}px 1px rgba(115, 115, 115, #{1 - (i/multiplier)})"
    return shadow

  getInitialState: ->
    shadow = @buildShadow(0, 0)

    text: 'DYNAMIC TEXT SHADOW'
    style: 
      textShadow: shadow

  onChange: (e) ->
    if e.target.value is ''
      @setState text: 'DYNAMIC TEXT SHADOW'
    else 
      @setState text: e.target.value  

  onMouseMove: (e) ->

    posX = (window.innerWidth / 2) - e.clientX 
    posY = (window.innerHeight / 2) - e.clientY   

    shadow = @buildShadow(posX, posY)

    @setState 
      style:
        textShadow: shadow


  render: ->
    <div 
      className="vertical-center-wrap"
      onMouseMove={@onMouseMove}>
      <input className="text-input" placeholder="Add Custom Text" onChange={@onChange}/>        
      <div className="vertical-center-item" style={@state.style}>{@state.text}</div>        
    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);