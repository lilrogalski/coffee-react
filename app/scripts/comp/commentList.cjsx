React = require 'react'
Comment = require "./comment"

module.exports = React.createClass

  render: ->

    <div className="commentList">
      <Comment author="Pete Hunt">This is one comment</Comment>
      <Comment author="Jordan Walke">This is *another* comment</Comment>
    </div>
