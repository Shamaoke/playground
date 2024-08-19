
let a = {
  then: function(fullfill, reject) {
    fullfill('ok!')
  }
}

let b = {
  then: function(fullfill, reject) {
    reject('fail')
  }
}

let c = {
  then: function(fullfill, reject) {
    Math.random() > 0.5 ? fullfill('ok')
                        : reject('error')
  }
}

let d = {
  then: function(fullfill, reject) {
    try {
      if (Math.random() > 0.5)
        fullfill('ok')
      else
        throw new Error('fail')
    }
    catch(msg) {
      reject(`Rejected with: ${msg}!`)
    }
  }
}

// Promise.resolve(a).then(v => console.log(v), err => console.log(err))

// Promise.resolve(b).then(v => console.log(`Fullfill with ${v}`), err => console.log(`Reject with ${err}`))

// Promise.resolve(c)
//   .then(v => console.log(`Fullfill with: ${v}.`))
//   .catch(err => console.log(`Reject with: ${err}.`))
//   .finally(() => console.log('Finish!'))

// Promise.resolve(d)
//   .then(v => console.log(`Fullfilled with: ${v}.`))
//   .catch(err => console.log(err))
//   .finally(( ) => console.log('Finished!'))
// or

try {
  console.log(`Fullfilled with: ${await Promise.resolve(d)}.`)
} catch(err) {
  console.log(err)
} finally {
  console.log('Finished!')
}

