React = require 'react'

module.exports = React.createClass 
  
  handleChange: ->
    @props.onUserInput @refs.filterTextInput.value, @refs.inStockOnlyInput.checked

  render: ->
    <form>
      <input 
        type="text" 
        placeholder="Search..."
        value={@props.filterText}
        ref="filterTextInput"
        onChange={@handleChange}
      />
      <p>
        <input 
          type="checkbox"
          checked={@props.inStockOnly}
          ref="inStockOnlyInput"
          onChange={@handleChange}
        />
        {''}
        Only show products in stock
      </p>
    </form>
