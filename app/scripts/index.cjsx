React = require 'react'
ReactDOM = require 'react-dom'

App = React.createClass
  
  getInitialState: ->
    color = "#616161"

    text: 'DYNAMIC TEXT SHADOW'
    style: 
      textShadow:"rgb(97, 97, 97) 0.104167px -0.0208333px 10px, 
                  rgb(97, 97, 97) 0.168539px -0.0337079px 11px, 
                  rgb(97, 97, 97) 0.272727px -0.0545455px 12px, 
                  rgb(97, 97, 97) 0.441176px -0.0882353px 13px, 
                  rgb(97, 97, 97) 0.714286px -0.142857px 14px, 
                  rgb(97, 97, 97) 1.15385px -0.230769px 15px, 
                  rgb(97, 97, 97) 1.875px -0.375px 16px, 
                  rgb(97, 97, 97) 3px -0.6px 17px, 
                  rgb(97, 97, 97) 5px -1px 18px, 
                  rgb(97, 97, 97) 7.5px -1.5px 19px"


  onChange: (e) ->
    @setState text: e.target.value
  
  onMouseMove: (e) ->
    posX = (window.innerWidth / 2) - e.clientX 
    posY = (window.innerHeight / 2) - e.clientY
    color = "#616161"

    @setState 
      style:
        textShadow:"#{posX/144}px #{posY/144}px #{10}px #{color},
                    #{posX/144}px #{posY/144}px #{10}px #{color},
                    #{posX/89}px #{posY/89}px #{10*1.1}px #{color},
                    #{posX/55}px #{posY/55}px #{10*1.2}px #{color},
                    #{posX/34}px #{posY/34}px #{10*1.3}px #{color},
                    #{posX/21}px #{posY/21}px #{10*1.4}px #{color},
                    #{posX/13}px #{posY/13}px #{10*1.5}px #{color},
                    #{posX/8}px #{posY/8}px #{10*1.6}px #{color},
                    #{posX/5}px #{posY/5}px #{10*1.7}px #{color},
                    #{posX/3}px #{posY/3}px #{10*1.8}px #{color},
                    #{posX/2}px #{posY/2}px #{10*1.9}px #{color},
                    #{posX/1.6}px #{posY/1.6}px #{10*2}px #{color},
                    #{posX/1.2}px #{posY/1.2}px #{10*2.1}px #{color},
                    #{posX/1}px #{posY/1}px #{10*2.2}px #{color}"


  render: ->
    <div 
      className="vertical-center-wrap"
      onMouseMove={@onMouseMove}>
      <input className="text-input" placeholder={@state.text} onChange={@onChange}/>        
      <div className="vertical-center-item" style={@state.style}>{@state.text}</div>        
    </div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);