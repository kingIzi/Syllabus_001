#include "include/SyHighlighter.h"

//initialize class
SyHighlighter::SyHighlighter(QObject *parent) : QSyntaxHighlighter(parent)
{
    this->format.setBackground(Qt::yellow);
}

//for all occurences of given text, highlight text
void SyHighlighter::highlightBlock(const QString &text)
{
    auto it = this->pattern.globalMatch(text);
    while (it.hasNext())
    {
        const auto match = it.next();
        this->setFormat(match.capturedStart(), match.capturedLength(), this->format);
    }
}

void SyHighlighter::setTextDocument(const QQuickTextDocument *document)
{
    if (this->document() == nullptr){
        this->setDocument(document->textDocument());
    }
}

//Find occurences of given text and select text
void SyHighlighter::searchText(const QQuickTextDocument * document,const QString &text)
{
    this->setTextDocument(document);
    this->pattern = QRegularExpression(text,QRegularExpression::CaseInsensitiveOption);
    this->rehighlight();
}

//get selected text from QTextDocument and highlight change Text format
void SyHighlighter::highlightText(const QQuickTextDocument *document, const int start, const int end)
{
    this->setTextDocument(document);
    if (start != end){
        QTextCursor cursor(document->textDocument());
        cursor.setPosition(start);
        cursor.setPosition(end,QTextCursor::KeepAnchor);
        if (this->revertFormatToNormal(cursor)) { return; }
        const auto text = cursor.selectedText();
        const auto highlightFormat = this->getHighlightTextCharFormat(cursor);
        cursor.removeSelectedText();
        cursor.insertText(text,highlightFormat);
    }
    //else emit signal to prompt user to select text
}

bool SyHighlighter::revertFormatToNormal(QTextCursor& cursor)
{
    auto currentFormat = cursor.charFormat();
    if (currentFormat.fontUnderline()){
        currentFormat.setFontUnderline(false);
        currentFormat.setFontWeight(QFont::Normal);
        const auto text = cursor.selectedText();
        cursor.removeSelectedText();
        cursor.insertText(text,currentFormat);
        return true;
    }
    else { return false; }
}

//set up different QTextCharFormat
QTextCharFormat SyHighlighter::getHighlightTextCharFormat(QTextCursor &cursor)
{
    QTextCharFormat plainFormat(cursor.charFormat());
    auto highlightFormat = plainFormat;
    highlightFormat.setFontWeight(QFont::ExtraBold);
    highlightFormat.setFontUnderline(true);
    highlightFormat.setUnderlineColor(Qt::black);
    highlightFormat.setUnderlineStyle(QTextCharFormat::SingleUnderline);
    return highlightFormat;
}




