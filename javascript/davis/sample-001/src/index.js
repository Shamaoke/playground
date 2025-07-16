
import express from 'express'

let app = express()
let port = 3355

app.get('/', (req, resp) => {
  console.log(`[${new Date()}][\x1b\x5b\x33\x34\x6dINFO\x1b\x5b\x30\x6d] Sending greeting to a new visitor...`)
  resp.send('Hello, world!')
})

app.listen(port, ( ) => {
  console.log(`Sample 001 application listening on port ${port}...`)
})

