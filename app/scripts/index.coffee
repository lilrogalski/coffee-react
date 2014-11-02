do ->
  window.React = require 'react'
  comments = require './comments'
  App = require './app'

  React.renderComponent App(comments: comments), document.body

