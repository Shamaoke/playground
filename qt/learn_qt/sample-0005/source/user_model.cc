
#include <QUuid>

#include "user_model.hh"

UserModel::UserModel(QObject* parent) : QAbstractListModel(parent) {

  users.append(User(QUuid::createUuid().toString(QUuid::WithoutBraces), "Pavel", "pavel@mail.com"));
  users.append(User(QUuid::createUuid().toString(QUuid::WithoutBraces), "Elena", "elena@mail.com"));
  users.append(User(QUuid::createUuid().toString(QUuid::WithoutBraces), "Jack", "jack@mail.com"));
  users.append(User(QUuid::createUuid().toString(QUuid::WithoutBraces), "Josh", "josh@mail.com"));
}

UserModel::~UserModel( ) { }

auto UserModel::rowCount(const QModelIndex& parent) const -> int {

  if (parent.isValid()) return 0;

  return users.size();
}

auto UserModel::data(const QModelIndex& index, int role) const -> QVariant {

  if (not index.isValid()) return QVariant { };

  if (index.row() < 0 or index.row() >= users.size()) return QVariant { };

  const auto& user { users.at(index.row()) };

  switch (role) {
    case IdRole:    return user.getId();
    case NameRole:  return user.getName();
    case EmailRole: return user.getEmail();
    default:        return QVariant { };
  }
}

auto UserModel::roleNames( ) const -> QHash<int, QByteArray> {
  return {
    { IdRole, "id" },
    { NameRole, "name" },
    { EmailRole, "email" }
  };
}

