do ->
  window.React = require 'react'
  ReactDOM = require 'react-dom'
  App = require './app'

  ReactDOM.render(
    React.createElement(App, null, null),
    document.getElementById("react-container")
  )

