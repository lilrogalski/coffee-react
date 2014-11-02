# @cjsx React.DOM

React = require 'react'
Comment = require './comment'

module.exports = React.createClass

  render: ->
    <div className="commentList">
      {
        @props.data.map (comment) ->
          <Comment comment={comment}/>
      }
    </div>
