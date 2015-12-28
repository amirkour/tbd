express = require 'express'
path = require 'path'
fs = require 'fs'
stylus = require 'stylus'
bodyparser = require 'body-parser'

# todo - add back Graph requirement, once it's ported over to coffeescript
# Graph = require './src/graph'

# the port this app will be listening on
port = process.argv[2] or 3000

# this has to be the fully-qualified path to a folder, typically "/public",
# where public/static assets will be served from
absolutePathToPublicAssets = process.argv[3] or path.join __dirname, 'public'

# this has to be the fully-qualified path to a folder, typically "/templates",
# where view templates will be found
absolutePathToTemplateFolder = process.argv[4] or path.join __dirname, 'templates'
app = express()

# To parse x-www-form-urlencoded request bodies Express.js can use urlencoded()
# middleware from the body-parser module.
app.use(bodyparser.urlencoded({extended: false}))

# note that express is defaulting to the index.html file located
# at the given path - and the given path is expected to be a folder.
console.log("html and css should be located here: " + absolutePathToPublicAssets)
app.use(express.static(absolutePathToPublicAssets))

# and enable the 'stylus' compiler.
# note that normally your public assets are located at
# <root folder>/public
#
# files located in your public/ subfolder can be referenced
# in html from the root.  ie: if foo.css is at public/foo.css,
# you'd reference it like this in html:
# <link href="/foo.css" ... />
#
# see!?  exclude the 'public' folder ...
app.use(stylus.middleware(absolutePathToPublicAssets))

# enable jade templates
app.set('views', absolutePathToTemplateFolder)
app.set('view engine', 'jade')

# parse query params and kick it back as json
app.get "/search", (req,res) ->
    console.log "Search ..."
    console.log req.query or "no query to log!?"

    if not req.query?
        res.send({})   #  note: using res.send kicks back json!?!
        return

    toRet = {}
    toRet[key] = value for key,value of req.query

    res.send(toRet) #  note: using res.send kicks back json!?!

# test out a template!
app.get '/home', (req,res) ->
    console.log("/home")
    res.render('index', {date: new Date().toDateString()})

# parse/barf form params!
app.post '/form', (req,res) ->
    console.log("Post to /form")
    if not req.body?
        console.log('no body, returning!')
        res.end("nothing to say!")
        return

    if not req.body.str
        console.log("user did not input anything in the form")
        res.end("Nothing to show!")
        return

    strReversed = req.body.str.split('').reverse().join('')
    res.end(strReversed)

console.log('listening on port ' + port)
app.listen(port)
