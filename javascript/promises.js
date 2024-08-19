// function sample( ) {
//   return new Promise( (resolve, reject) => {
//     let result = Math.random() > 0.5
//     try {
//       if (result) {
//         resolve('ok!')
//       }
//       else {
//         throw new Error('fail!')
//       }
//     }
//     catch(e) {
//       reject(e)
//     }
//   } )
// }
//
// sample()
//   .then(result => console.log(result))
//   .catch(error => console.log(error))
//   .finally(( ) => console.log('finished!'))

async function sample() { } //=> will return a promise

function process(data) { }

async function main() {
  let data = await sample()

  process(data)
}
