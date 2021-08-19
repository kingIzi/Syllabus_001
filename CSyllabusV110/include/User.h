#include <QObject>
#include <QString>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <memory>
#include <QUrl>
#include <QJsonDocument>
//api key AIzaSyCAHQVptSjGekXBQfO_Hqw8LXc39PbnSqM


class User : public QObject{
    Q_OBJECT
    using Manager = QNetworkAccessManager;
    using Reply = QNetworkReply;

private:
    const char* firebaseApiKey = "AIzaSyCAHQVptSjGekXBQfO_Hqw8LXc39PbnSqM";
//    std::shared_ptr<Manager*> manager = nullptr;
//    std::shared_ptr<Reply*> reply = nullptr;
    Manager* manager = nullptr;
    Reply* reply = nullptr;

private:
    void post(const QString& url,const QJsonDocument& response);

public slots:
    void networkReplyReadyRead();
    void onSignUpClicked(QString emailAddress,QString password);

public:
    explicit User(QObject * parent = nullptr);
    ~User();
    void signUpUser(const QString& username,const QString& password);

};
