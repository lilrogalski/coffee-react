React = require 'react'

module.exports = React.createClass 
  
  render: ->
    <form>
      <input type="text" placeholder="Search..."/>
      <p>
        <input type="checkbox"/>
        {''}
        Only show products in stock
      </p>
    </form>
