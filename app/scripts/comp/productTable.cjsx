React = require 'react'
ProductRow = require './productRow'
ProductCategoryRow = require './productCategoryRow'

module.exports = React.createClass 
  
  render: ->
    rows = []
    lastCategory = null
    @props.products.forEach (product) ->
      if product.category isnt lastCategory
        rows.push(<ProductCategoryRow category={product.category} key={product.category}/>)

      rows.push(<ProductRow product={product} key={product.name} />)

      lastCategory = product.category 

    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
