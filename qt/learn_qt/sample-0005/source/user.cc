
#include "user.hh"

User::User(QString id, QString name, QString email) :
  id { id },
  name { name },
  email { email }
{ }

auto User::getId( ) const -> QString { return this->id; }
auto User::getName( ) const -> QString { return this->name; }
auto User::getEmail( ) const -> QString { return this->email; }

auto User::setId(QString id) -> void { this->id = id; }
auto User::setName(QString name) -> void { this->name = name; }
auto User::setEmail(QString email) -> void { this->email = email; }

