//  imageloader.cpp

#include "imageloader.h"
#include <QDebug>

ImageLoader::ImageLoader(QObject *parent)
    : QObject(parent)
{
    connect(&m_watcher, &QFileSystemWatcher::directoryChanged, this, &ImageLoader::reloadImages);
}

QStringList ImageLoader::images() const
{
    return m_images;
}

void ImageLoader::setImageFolder(const QString &folder)
{
    if (m_dir.path() != folder) {
        m_dir.setPath(folder);
        m_watcher.addPath(folder);
        reloadImages();
    }
}

void ImageLoader::reloadImages()
{
    QStringList fileNames = m_dir.entryList(QStringList() << "*.jpg" << "*.png", QDir::Files);
    m_images.clear();
    for (const QString &fileName : fileNames) {
        // Добавляем полный путь к файлу
        m_images.append(m_dir.absoluteFilePath(fileName));
    }
    qDebug() << "Loaded images:" << m_images; // Логирование полных путей
    emit imagesChanged();
}
