#pragma one

class SyHighlighter : public QSyntaxHighlighter{
    Q_OBJECT
public:
    explicit SyHighlighter(QObject * parent = nullptr);
public slots:
    void searchText(const QQuickTextDocument * document = nullptr,const QString& text = nullptr);
    void highlightText(const QQuickTextDocument * document = nullptr,const int start = 0,const int end = 0);
protected:
    void highlightBlock(const QString& text) override;
private:
    bool revertFormatToNormal(QTextCursor& cursor);
    QTextCharFormat getHighlightTextCharFormat(QTextCursor& cursor);
    void setTextDocument(const QQuickTextDocument * document);
private:
    QRegularExpression pattern;
    QTextCharFormat format;
};


