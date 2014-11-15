module.exports = React.createClass  
  
  render: ->
    
    createItem = (itemText) ->
      <li>{itemText}</li>
  
    <ul>{@props.items.map(createItem)}</ul>
