React = require 'react'

module.exports = React.createClass 
  
  render: ->
    name = @props.product.name if @props.product.stocked else 
      <span style={{color: 'red'}}>{@props.product.name}</span>

    <tr>
      <td>{name}</td>
      <td>{@props.product.price}</td>
    </tr>


  