#ifndef SCORE_H
#define SCORE_H
#include <QObject>

class score:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int M_score READ M_score WRITE setM_score NOTIFY M_scoreChanged)
public:
    int M_score();
    void setM_score(int);
    explicit score(QObject *parent = 0);
    ~score();
private:
    int my_score;
signals:
    void M_scoreChanged();
};

#endif // SCORE_H
