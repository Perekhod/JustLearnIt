//  imageloader.cpp

#include "imageloader.h"
#include <QDebug>

ImageLoader::ImageLoader(QObject *parent)
    : QObject(parent)
{
    // Подключаем сигнал изменения папки к слоту перезагрузки картинок
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
        m_watcher.addPath(folder); // Начинаем следить за папкой
        reloadImages(); // Перезагружаем картинки
    }
}

void ImageLoader::reloadImages()
{
    m_images = m_dir.entryList(QStringList() << "*.jpg" << "*.png", QDir::Files); // Фильтруем по расширениям
    qDebug() << "Loaded images:" << m_images; // Отладочный вывод
    emit imagesChanged(); // Испускаем сигнал
}
