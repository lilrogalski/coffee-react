# @cjsx React.DOM

React = require 'react'

module.exports = React.createClass

  render: ->
    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      {@props.children}
    </div>