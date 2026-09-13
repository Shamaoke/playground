
#pragma once

#include <QString>

class User {

  private:
    QString id;
    QString name;
    QString email;

  public:
    User(QString id, QString name, QString email);

    auto getId( ) const -> QString;
    auto getName( ) const -> QString;
    auto getEmail( ) const -> QString;

    auto setId(QString id) -> void;
    auto setName(QString name) -> void;
    auto setEmail(QString email) -> void;
};

