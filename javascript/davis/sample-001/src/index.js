
import express from 'express'

let app = express()
let port = 3355

app.get('/', (req, resp) => {
  resp.send('Hello, world!')
})

app.listen(port, ( ) => {
  console.log(`Sample 001 application listening on port ${port}...`)
})

