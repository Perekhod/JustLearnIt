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
    Q_PROPERTY(QStringList images READ images NOTIFY imagesChanged) // Свойство для QML

public:
    explicit ImageLoader(QObject *parent = nullptr);

    QStringList images() const; // Геттер для списка картинок

    Q_INVOKABLE void setImageFolder(const QString &folder); // Метод для установки папки

signals:
    void imagesChanged(); // Сигнал должен быть объявлен здесь

private slots:
    void reloadImages(); // Перезагрузка картинок при изменении папки

private:
    QDir m_dir; // Папка с картинками
    QFileSystemWatcher m_watcher; // Наблюдатель за изменениями в папке
    QStringList m_images; // Список картинок
};

#endif // IMAGELOADER_H
