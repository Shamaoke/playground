
#include <QObject>
#include <QTest>

#include "status_provider.hh"

class StatusProviderTest : public QObject {

  Q_OBJECT

  private Q_SLOTS:
    auto returnsReadyStatus( ) -> void {

      auto statusProvider { StatusProvider { } };

      auto actual { statusProvider.ready( ) };
      auto expected { QStringLiteral("Готов!") };

      QCOMPARE(actual, expected);
    }

    auto returnsMousePressedStatus( ) -> void {

      auto statusProvider { StatusProvider { } };

      auto actual { statusProvider.mousePressed( ) };
      auto expected { QStringLiteral("Клик мышью!") };

      QCOMPARE(actual, expected);
    }

    auto returnsSpacePressedStatus( ) -> void {

      auto statusProvider { StatusProvider { } };

      auto actual { statusProvider.spacePressed( ) };
      auto expected { QStringLiteral("Нажат пробел!") };

      QCOMPARE(actual, expected);
    }
};

QTEST_APPLESS_MAIN(StatusProviderTest)

#include "status_provider_test.moc"

