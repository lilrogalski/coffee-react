React = require 'react'

module.exports = React.createClass
  
  render: ->
    listItems = @props.names.map((friend)->
      <li>{friend}</li>
    )

    <div>
      <h3> Friends </h3>
      <ul>{listItems}</ul>
    </div>

