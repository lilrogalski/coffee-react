React = require 'react'
ReactDOM = require 'react-dom'
ProductTable = require './comp/productTable'
ProductCategoryRow = require './comp/productCategoryRow'
ProductRow = require './comp/productRow'
SearchBar = require './comp/searchBar'

data = [
  {category: 'Sporting Goods', price: '$49.99', stocked: true, name: 'Football'},
  {category: 'Sporting Goods', price: '$9.99', stocked: true, name: 'Baseball'},
  {category: 'Sporting Goods', price: '$29.99', stocked: false, name: 'Basketball'},
  {category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
  {category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
  {category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
]

FilterableProductTable = React.createClass
  
  getInitialState: ->
    filterText: ''
    inStockOnly: false

  handleUserInput: (filterText, inStockOnly) ->
    @setState
      filterText: filterText
      inStockOnly: inStockOnly

  render: ->
    <div>
      <SearchBar 
        filterText={@state.filterText}
        inStockOnly={@state.inStockOnly}
        onUserInput={@handleUserInput}
      />
      <ProductTable 
        products={@props.products} 
        filterText={@state.filterText} 
        inStockOnly={@state.inStockOnly} 
      />
    </div>



ReactDOM.render(
  <FilterableProductTable products={data}/>,
  document.getElementById('app')
);