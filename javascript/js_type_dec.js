/**
 * @param  {number}     n
 * @param  {number[ ]}  a
 * @param  {number[ ]} [r]
 * @param  {number}    [h]
 * @param  {number[ ]} [t]
 * @return {number}
 */

/** @type { function(number):
 *          function(number[ ],
 *                   [number[ ]],
 *                   [number],
 *                   [number[ ]]):
 *          number }
 */

/** @type { function(number):
 *          function(Array<number>,
 *                   [Array<number>],
 *                   [number],
 *                   [Array<number>]):
 *          number }
 */

/** @type { number ->
 *          Array<number> ->
 *          Array<number> ->
 *          number ->
 *          Array<number> ->
 *          number }
 */
let f = n => (a, r = [ ], [h, ...t] = a) => ?result

let g = n => a => (r = [ ]) => ([h, ...t] = a) => ?result

let h = n =>
        a =>
        (r = [ ]) =>
        ([h, ...t] = a) => ?result

