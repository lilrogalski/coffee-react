React = require 'react'

module.exports = React.createClass 
  
  render: ->
    name = 
      if @props.product.stocked
        @props.product.name  
      else 
        <span style={{color: 'red'}}>{@props.product.name}</span>

    <tr>
      <td>{name}</td>
      <td>{@props.product.price}</td>
    </tr>


  