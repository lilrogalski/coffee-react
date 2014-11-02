do ->
  window.React = require 'react'
  data = require './comments'
  App = require './app'

  React.renderComponent App(comments: comments), document.body

