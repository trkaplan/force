_     = require 'underscore'
Page  = require '../../models/page'

@about = (req, res) ->
  page  = null
  nav   = null

  render = _.after 2, ->
    res.render './template.jade', { page: page, nav: nav }

  new Page(id: 'about').fetch
    success: (response) -> page = response; render()
    error: res.backboneError
  new Page(id: 'about-nav').fetch
    success: (response) -> nav = response; render()
    error: res.backboneError
