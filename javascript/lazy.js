/* let Misc =
 * { lazy: (v) => ( ) => v,
 *   succ: (n) => n + 1 }
 */

/* function Stream (v)
 * { this.v = v
 *   this.n = new Stream(Misc.succ(v)) }
 */

/* function Stream (v)
 * { this.v = v
 *   this.n = new Stream(Misc.lazy(Misc.succ(v))) }
 *
 * let s = new Stream(0)
 */

/* let lazy = v => ( ) => v
 *
 * let succ = n => lazy(n + 1)
 *
 * let n = 0
 *
 * console.log(succ(succ(succ(n)())())())
 */
