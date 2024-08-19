let optional = {
  Some: function (v) { this._v = v },
  None: function ( ) { },
}

let _exist  = v => v != null
let _absent = v => v == null

let set = v => new optional.Some(v)

///

// let Optional = {
//   of: function(v) {
//
//     let _exist  = v => v != null
//     let _absent = v => v == null
//
//     return {
//       get: function( ) {
//         return _exist(v) ? Optional.of(v)
//                          : Optional.of(null)
//       }
//     }
//   }
// }
