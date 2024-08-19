class VisitsCount extends Map {
  constructor() {
    super([[ 'visits_count', 0 ]])
  }

  succ() {
    this.set('visits_count', this.get('visits_count') + 1)
  }

  get_visits_count() {
    return this.get('visits_count')
  }
}

class Users extends Map {
  constructor(...names) {
    super()
    for (let name of names)
      this.set(name, new User(name))
  }
}

class User extends Map {
  constructor(name) {
    super([[ 'name', name.toUpperCase() ]])
  }
}

class Data extends WeakMap {
  constructor(users) {
    super()
    for (let user of users.values())
      this.set(user, new VisitsCount())
    this.users = users
  }

  get_user(name) {
    return this.users.get(name)
  }

  inc_visits_count_for(user) {
    this.get(this.get_user(user)).succ()
  }

  get_visits_count_for(name) {
    return this.get(this.get_user(name)).get_visits_count()
  }
}

/* vim: set textwidth=60 colorcolumn=60: */
