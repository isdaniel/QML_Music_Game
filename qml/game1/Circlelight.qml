import QtQuick 2.0
import VPlay 2.0
import "../game1"
Item{
    EntityBase{
        entityType:"circle"
        x:scene1.width/2
        y:scene1.height/2
        SpriteSequenceVPlay{
            id:circlelight
            width:200
            height:200
            running:song1||song2||song3||song4
            anchors.verticalCenter:parent.verticalCenter
            anchors.horizontalCenter:parent.horizontalCenter
            SpriteVPlay {
                frameCount:36
                frameWidth:521
                frameHeight:523
                frameDuration:80
                source: "../../assets/img/gamescens/protect(2).png"
            }
        }
        CircleCollider{
            id:circlelightCollider
            radius:circlelight.width*0.44
            x:scene1.width*0.22
            y:scene1.height*0.3
            collisionTestingOnlyMode:true
        }
    }//外圓的碰撞
    EntityBase{
        x:scene1.width*0.33
        y:scene1.height/4
        id:discircle
        entityType:"discircle"
        CircleCollider{
            id:discirclecollider
            radius:circlelight.width*0.18
            x:scene1.width*0.21
            y:scene1.height*0.3
        }
    }//內圓的碰撞
}


