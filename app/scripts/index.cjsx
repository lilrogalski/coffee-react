React = require 'react'
ReactDOM = require 'react-dom'

App = React.createClass
  
  render: ->

# In this example we also have two components - a picture and
# a picture list. The pictures are fetched from Instagram via AJAX.
Picture = React.createClass
  
  clickHandler: ->
    # When the component is clicked, trigger the onClick handler that 
    # was passed as an attribute when it was constructed:
    @props.onClick @props.id
    
  render: ->
    classes = 'picture ' + (if @props.favorite then 'favorite' else '')

    <div className={classes} onClick={@clickHandler}>
      <img src={@props.src} width="200" title={@props.title} />
    </div>

PictureList = React.createClass
  getInitialState: ->
    # The pictures array will be populated via AJAX, and 
    # the favorites one when the user clicks on an image:
    pictures: []
    favorites: []
    
  componentDidMount: ->
    # When the component loads, send a jQuery AJAX request
    self = this
    
    # API endpoint for Instagram's popular images for the day
    url = "https://api.instagram.com/v1/media/popular?client_id=#{@props.apiKey}&callback=?"
    
    $.getJSON url, (result) ->
      
      if !result or !result.data or !result.data.length
      else

      pictures = result.data.map((p) ->
        {
          id: p.id
          url: p.link
          src: p.images.low_resolution.url
          title: if p.caption then p.caption.text else ''
          favorite: false
        }
      )
      # Update the component's state. This will trigger a render.
      # Note that this only updates the pictures property, and does
      # not remove the favorites array.
      self.setState 
        pictures: pictures

  pictureClick: (id) ->
    # id holds the ID of the picture that was clicked.
    # Find it in the pictures array, and add it to the favorites
    favorites = @state.favorites
    pictures = @state.pictures

    for i in pictures 
      # Find the id in the pictures array
      if i.id == id
        if i.favorite
        else 
          favorites.push i 
          i.favorite = true 


    # Update the state and trigger a render
    @setState
      pictures: pictures
      favorites: favorites
  
  
  favoriteClick: (id) ->
    # Find the picture in the favorites array and remove it. After this, 
    # find the picture in the pictures array and mark it as a non-favorite.
    favorites = @state.favorites
    pictures = @state.pictures

    for i in favorites
      break if i.id == id

    
    # Remove the picture from favorites array
    favorites.splice i, 1

    for i in pictures
      if i.id == id
        i.favorite = false
    
    # Update the state and trigger a render
    @setState
      pictures: pictures
      favorites: favorites
  
  render: ->
    
    self = this
    
    pictures = @state.pictures.map((p, i)->
      <Picture key={i} id={p.id} src={p.src} title={p.title} favorite={p.favorite} onClick={self.pictureClick} />
    )

    if !pictures.length
      pictures = <p>Loading images..</p>
        
    favorites = @state.favorites.map((p, i) ->
      <Picture key={i} id={p.id} src={p.src} title={p.title} favorite={true} onClick={self.favoriteClick} />
    )

    if !favorites.length
      favorites = <p>Click an image to mark it as a favorite.</p>

    <div>
      <h1>Popular Instagram pics</h1>
      <div className="pictures"> {pictures} </div>

      <h1>Your favorites</h1>
      <div className="favorites"> {favorites} </div>
    </div>

ReactDOM.render(
  <PictureList apiKey="642176ece1e7445e99244cec26f4de1f" />,  
  document.getElementById('app')
);