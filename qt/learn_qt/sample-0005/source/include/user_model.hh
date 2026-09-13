
#pragma once

#include <QAbstractListModel>
#include <QtQml>

#include "user.hh"

class UserModel : public QAbstractListModel {

  Q_OBJECT

  QML_ELEMENT

  private:
    QList<User> users;

  public:

    enum UserRoles {
      IdRole = 257,
      NameRole = 258,
      EmailRole = 259,
    };

    explicit UserModel(QObject* parent = nullptr);

    ~UserModel( ) override;

    auto rowCount(const QModelIndex& parent = QModelIndex { }) const -> int override;

    auto data(const QModelIndex& index, int role = Qt::ItemDataRole::DisplayRole) const -> QVariant override;

    auto roleNames( ) const -> QHash<int, QByteArray> override;
};

