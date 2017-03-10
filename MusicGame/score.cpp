#include "score.h"

score::score(QObject *parent):QObject(parent),my_score(0)
{
}

score::~score()
{

}
int score::M_score(){
    return my_score;
}
void score::setM_score(int M_score){
    if(M_score!=my_score)
       my_score=M_score;
    emit M_scoreChanged();
}

