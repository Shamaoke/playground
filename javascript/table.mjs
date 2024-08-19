import Utils from './utils.mjs'

console.table(
  { is_empty: Utils.is_empty([ ]),
    is_not_empty: Utils.is_empty([1]) } )

console.table(
  [ ['is_empty',     '[ ]', Utils.is_empty([ ])],
    ['is_not_empty', '[1]', Utils.is_empty([1])] ],

    ['1', '2'] )
