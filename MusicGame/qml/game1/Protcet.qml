import QtQuick 2.3
import VPlay 2.0
import "../game1"
EntityBase{
    entityType: "earth"
    Image {
        width:70
        height:70
        id:earth
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../../assets/img/1680.png"
    }
    CircleCollider{
        radius:30
        anchors.centerIn:earth
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {
           var collidedEntity = other.parent.parent.parent
            if(collidedEntity.entityType === "monster3") {
                lifes=lifes-0.1
                collidedEntity.removeEntity()
                clickbox=0
            }
        }
    }
}









