
import cluster from 'node:cluster'
import http from 'node:http'
import os from 'node:os'
import process from 'node:process'

let numCPUs = os.availableParallelism()

console.log('Program is started!')

if (cluster.isPrimary) {
  console.log(`${numCPUs} CPUs is available.`)
  console.log(`Primary ${process.pid} is running.`)

  // for (let i = 0; i < numCPUs; i = i + 1)
  //   cluster.fork()
  let worker = cluster.fork()

  worker.on('exit', (worker, code, signal) => { console.log(`Worker ${worker.process.pid} died.`) })

} else {
  http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' })
    res.end('ありがとう！\n')
  }).listen(8000)

  console.log(`Worker ${process.pid} started.`)
}

