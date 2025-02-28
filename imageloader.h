//  imageloader.h

#ifndef IMAGELOADER_H
#define IMAGELOADER_H

#include <QObject>
#include <QDir>
#include <QFileSystemWatcher>
#include <QStringList>

class ImageLoader : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList images READ images NOTIFY imagesChanged)

public:
    explicit ImageLoader(QObject *parent = nullptr);
    QStringList images() const;
    Q_INVOKABLE void setImageFolder(const QString &folder);

signals:
    void imagesChanged();

private slots:
    void reloadImages();

private:
    QDir m_dir;
    QFileSystemWatcher m_watcher;
    QStringList m_images;
};

#endif // IMAGELOADER_H
