#include "../include/User.h"
#include <QDebug>
#include <QVariantMap>
#include <QNetworkRequest>

using Request = QNetworkRequest;

User::User(QObject *parent) :
    QObject(parent)
{
    this->manager = new Manager(this);
}

User::~User()
{

}

void User::signUpUser(const QString &emailAddress, const QString &password)
{
    QVariantMap signup;
    signup["email"] = emailAddress;
    signup["password"] = password;
    signup["returnSecureToken"] = true;
    const auto endPoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + QString(this->firebaseApiKey);
    const auto document = QJsonDocument::fromVariant(signup);
    this->post(endPoint,document);
}

void User::post(const QString &url, const QJsonDocument &document)
{
    Request request((QUrl(url)));
    request.setHeader(Request::ContentTypeHeader,QString("application/json"));
    this->reply = this->manager->post(request,document.toJson());
    QObject::connect(this->reply,&Reply::readyRead,this,&User::networkReplyReadyRead);
}

void User::networkReplyReadyRead()
{
    qDebug() << this->reply->readAll();
}

void User::onSignUpClicked(QString emailAddress, QString password)
{
    this->signUpUser(emailAddress,password);
}
