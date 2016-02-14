React = require 'react'
ReactDOM = require 'react-dom'
CommentBox = require './comp/commentBox'

ReactDOM.render(
  <CommentBox />,
  document.getElementById('app')
);