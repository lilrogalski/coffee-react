do ->
  window.React = require 'react'
  data = require './data'
  App = require './app'

  React.renderComponent App(data: data, pollInterval: 2000), document.body

