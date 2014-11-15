do ->
  window.React = require 'react'
  data = require './data'
  App = require './app'

  React.renderComponent App(), document.body

