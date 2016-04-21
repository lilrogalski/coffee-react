React = require 'react'
ReactDOM = require 'react-dom'
ReactCSSTransitionGroup = require 'react-addons-css-transition-group'

# https://api.instagram.com/oauth/authorize/?client_id=fd4073193f424e86b3d5cc32b45ba345&redirect_uri=http://localhost:3001/handleauth&response_type=token

# 3136760710.fd40731.a157482416fb4fc8be20bf22e2c472b7
ParamsForm = React.createClass 
  
  handleSubmit: (e) ->
    e.preventDefault()

    tagName = ReactDOM.findDOMNode(@refs.tagName).value.trim()

    return if !tagName 

    @props.onSubmit tagName
    ReactDOM.findDOMNode(@refs.tagName).value = ''

  render: ->
    <form className="form" onSubmit={@handleSubmit}>
      <input type="text" placeholder="Tag name" ref="tagName" />
    </form>

ItemBox = React.createClass
  
  loadItemsFromServer: ->
    self = @
    client_id = "fd4073193f424e86b3d5cc32b45ba345"
    token = "a157482416fb4fc8be20bf22e2c472b7"
    
    $.ajax
      url: "https://api.instagram.com/v1/tags/#{self.state.tagName}/media/recent?access_token=#{token}&start=0&count='#{self.props.count}&callback=?"
      jsonp: 'callback'
      dataType: 'jsonp'
      cache: false
      
      success: ((data) ->
        console.log url 

        @setState 
          data: data.data
        
        # console.log data
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
    # setInterval @loadItemsFromServer, @props.pollInterval

  render: ->
    <div className="items">
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

Item = React.createClass 
  render: ->
    <div className="item col-sm-3">
      <div className="item__pic">
        <img src={this.props.pic} />
      </div>
      <div className="item__content">
        <div className="item__author">{this.props.author}</div>
        <div className="item__text">{this.props.children.substring(0,120)}</div>
      </div>
    </div>

    
ReactDOM.render(
  <ItemBox tagNameDefault="pineapplechunk" count={20} pollInterval={1000} />,
  document.getElementById('app')
);