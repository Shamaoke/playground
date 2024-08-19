/* :::WeakMap::: */

// The motivation behind the weak map is to allow storing
// additional information of an object not in a structure of
// this object, but in a separate object. E. g.
//
// { one: 'ok!' } => { desc: 'This is `one`. It\'s ok!' }
//
// By the idea, this storage should be more effective then
// the regular map in respect of memory consumption and the
// set and search operations.

let users = { }

users.pavel = { name: 'Pavel' }
users.elena = { name: 'Elena' }

// Let's suppose that there's a reason we don't want or
// are allowed (by the means of Object.freeze() or Object.seal())
// to store addition information about the objects, so for
// that purpose we create separate objects and map them with
// the original ones. The mappings are created through
// a weak map object.

let data = new WeakMap()

data.set(users.pavel, { visits_count: 0 })
data.set(users.elena, { visits_count: 0 })

delete users.pavel
delete users.elena
// Here we remove all references to objects stored in the
// weak map as keys, so these objects a expected to be removed
// from memory by the GC. Also, the corresponding objects, for
// which the removed objects was the keys are expected to also
// be removed from memory, since they are not reachable anymore.
// That's how the weak map works.

/* vim: set textwidth=60 colorcolumn=60: */
