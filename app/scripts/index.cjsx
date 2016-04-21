React = require 'react'
ReactDOM = require 'react-dom'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

LOG = ''
TAGNAME = 'testing'
COUNT = 10
INTERVAL = 1000

console.clear()

Item = React.createClass 
  render: ->
    <div className="item">
      <div className="item__pic">
        <img src={this.props.pic} />
      </div>
      <div className="item__content">
        <div className="item__author">{this.props.author}</div>
        <div className="item__text">{this.props.children}</div>
      </div>
    </div>

ItemBox = React.createClass
  loadItemsFromServer: ->
    self = @
    client_id = "0c4a119af8d54538af6061cb3b5ff617"

    $.ajax
      url: "https://api.instagram.com/v1/tags/#{self.state.tagName}/media/recent?client_id=#{client_id}&start=0&count='#{self.props.count}&callback=?"
      jsonp: 'callback'
      dataType: 'jsonp'
      cache: false
      
      success: ((data) ->
        if LOG
          console.log data

        @setState 
          data: data.data
      ).bind(this)
      
      error: ((xhr, status, err) ->
        console.error xhr, status, err.toString()
      ).bind(this)

  handleTagNameSubmit: (tagName) ->
    @setState 
      tagName: tagName

  getInitialState: ->
    data: []
    tagname: @props.tagNameDefault

  componentDidMount: ->
    @loadItemsFromServer
    setInterval @loadItemsFromServer, @props.pollInterval

  render: ->
    <div className="items">
      <h1>Items</h1>
      <ParamsForm onSubmit={@handleTagNameSubmit} />
      <ItemList data={@state.data} />
    </div>    

ItemList = React.createClass
  render: ->
    itemNodes = @props.data.map((item, i) ->
      name = 'No caption :('
      text = 'No caption :('

      if item.caption 
        text = item.caption.text 

      <Item key={i} author={item.user.full_name} pic={item.images.thumbnail.url}>{text}</Item>
    )

    <div className="items__list">
      <ReactCSSTransitionGroup transitionName="animation" transitionEnterTimeout={500} transitionLeaveTimeout={500}>
        {itemNodes}
      </ReactCSSTransitionGroup>
    </div>

ParamsForm = React.createClass 
  handleSubmit: (e) ->
    e.preventDefault()

    tagName = ReactDOM.findDOMNode(@refs.tagName).value.trim()

    return if !tagName 

    @props.onSubmit tagName
    ReactDOM.findDOMNode(@refs.tagName).value = ''

  render: ->
    <form className="form" onSubmit={this.handleSubmit}>
      <input type="text" placeholder="Tag name" ref="tagName" />
      <input type="submit" value="Get" />
    </form>
    
ReactDOM.render(
  <ItemBox tagNameDefault={TAGNAME} count={COUNT} pollInterval={INTERVAL} />,
  document.getElementById('app')
);