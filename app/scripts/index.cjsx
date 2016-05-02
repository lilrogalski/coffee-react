React = require 'react'
ReactDOM = require 'react-dom'

App = React.createClass

  getInitialState: ->
    multiples: 50
    text: 'DYNAMIC TEXT SHADOW'
    curposX: 100
    curposY: 100

  buildShadow: (posX, posY) ->
    shadow = []   
    multi = @state.multiples 
    for i in [1..multi]
      shadow.push  "#{(posX * i) / multi}px #{(posY * i) / multi}px 1px rgba(115, 115, 115, #{1 - (i/multi)})"
    return shadow

  updateMultiples: (e) ->
    @setState 
      multiples: e.target.value
    , @updateShadows

  textChange: (e) ->
    if e.target.value is ''
      @setState text: 'DYNAMIC TEXT SHADOW'
    else 
      @setState text: e.target.value  

  onMouseMove: (e) ->
    posX = (window.innerWidth / 2) - e.clientX 
    posY = (window.innerHeight / 2) - e.clientY   

    @setState
      curposX: posX
      curposY: posY

    @updateShadows(e)

  updateShadows: ->
    @setState 
      style:
        textShadow: @buildShadow(@state.curposX, @state.curposY)

  render: ->
    <div 
      className="vertical-center-wrap"
      onMouseMove={@onMouseMove}>

        <input type="text" className="text-input" placeholder="Add Custom Text" onChange={@textChange}/>                
        <input type="range" min="5" max="100" className="num-input" value={@state.multiples} onChange={@updateMultiples}/>   

        <div className="vertical-center-item" style={@state.style}>{@state.text} x {@state.multiples}</div>    

    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);