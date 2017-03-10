import QtQuick 2.0
import VPlay 2.0
import "../game1"

EntityBase{
    id:healthbar
    Image {
        z:2
        id:hpimg
        source:"../../assets/img/gamescens/HP.png"
        width:180
        height:30
    }
    Image {
        z:1
        id: lifess
        source: "../../assets/img/HP.png"
        x:hpimg.x+22
        y:hpimg.y+13
        width:135*gameWindow.lifes+5
        height:15
    }
}
