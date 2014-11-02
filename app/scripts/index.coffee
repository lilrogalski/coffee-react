do ->
  window.React = require 'react'
  App = require './app'

  React.renderComponent App({}), document.body

