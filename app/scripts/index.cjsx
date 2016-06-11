React = require 'react'
ReactDOM = require 'react-dom'
Animate = require 'react-addons-css-transition-group'

App = React.createClass

  onClick: (e) ->

    @removeDots()

    particleDensity = 20

    for particle in [0..particleDensity]
      dot = document.createElement 'div'
      dot.className = "dot"
      dot.style.position = "absolute"
      dot.style.top = "#{e.pageY - 30}px"
      dot.style.left = "#{e.pageX - 30}px"
      dot.style.position = "absolute"
      dot.style.background = @randomColor()
      dot.style.transform = "translate3d(0,0,0) scale(#{@randomNumber(.2, .8)})"
      document.body.appendChild dot

      setTimeout => @animateDots()


  removeDots: ->
    oldDots = document.querySelectorAll '.dot'
    for dot in oldDots 
      dot.parentNode.removeChild dot

  animateDots: ->
    range = 300

    newDots = document.querySelectorAll '.dot'
    for dot in newDots 
      dot.style.transform = "translate3d(#{@randomNumber(-range, range)}px, #{@randomNumber(-range, range)}px, 0) scale(0)"

  randomNumber: (min, max) ->
    Math.random() * (max - min) + min

  randomColor: ->
    '#' + Math.random().toString(16).slice(2, 8)

  render: ->
    <div className="bg" onClick={@onClick}></div>
    
ReactDOM.render(
  <App />,
  document.getElementById('app')
);