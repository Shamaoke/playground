
#include <QObject>
#include <QTest>

#include "status.hh"

class StatusTest : public QObject {

  Q_OBJECT

  private Q_SLOTS:
    auto returnsReadyStatus() -> void {

      auto status { Status { } };

      auto actual { status.ready( ) };
      auto expected { QStringLiteral("Готов!") };

      QCOMPARE(actual, expected);
    }
};

QTEST_APPLESS_MAIN(StatusTest)

#include "status_test.moc"

