import VPlay 2.0
import QtQuick 2.0
import "../newgui"
import QtQuick.Particles 2.0
Basescene{
    signal startPress
    Timer{
        running:gameWindow.state==="startsed"
        interval:40
        repeat:true
        onTriggered:{
            startcircle.rotation+=2
            if(startcircle.rotation>=10000)startcircle.rotation=0
        }
    }
    Image {
        z:-3
        id: startbg
        anchors.fill:parent
        source: "../../assets/img/startbg/start.jpg"
    }
    Image {
        id:startcircon
        anchors.fill:parent
        source: "../../assets/img/startbg/circon.png"
    }
    Image{
        id:startpress
        z:-1
        anchors.verticalCenter:parent.verticalCenter
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.verticalCenterOffset:80
        width:118
        height:65
        source: "../../assets/img/startbg/press.png"
    }
    SequentialAnimation {
        running: true
        loops: Animation.Infinite
        NumberAnimation {
            target: startpress
            duration: 1000
            property: "opacity"
            to:0.5
        }
        NumberAnimation {
            target: startpress
            duration: 1000
            property: "opacity"
            to:1
        }
    }
    Image {
        id:startcircle
        z:-1
        x:-50
        y:-50
        width:310
        height:300
        opacity:0.3
        source:"../../assets/img/startbg/startcitcle.png"
    }
    SequentialAnimation {
        running: true
        loops: Animation.Infinite
        NumberAnimation {
            target: startcircle
            duration: 1800
            property: "opacity"
            to:0
        }
        NumberAnimation {
            target: startcircle
            duration: 2700
            property: "opacity"
            to:0.4
        }
    }
    MouseArea{
        anchors.fill:parent
        onClicked:startPress()
    }
    Connections {
        target: nativeUtils
        onMessageBoxFinished: {
            if(accepted) {
                Qt.quit()
            }
        }
    }
    onBackButtonPressed: {
        nativeUtils.displayMessageBox("Really quit the game?", "", 2);
    }
        ParticleSystem {
            id: particleSystem
        }
        Emitter {
            id: emitter
            anchors.fill:parent
            system: particleSystem
            emitRate: 20
            lifeSpan: 1000
            lifeSpanVariation: 500
            size:14
            endSize: 6
        }
        ImageParticle {
            z:-2
            source: "../../assets/img/startbg/star.png"
            system: particleSystem
            colorVariation: 0.2
            rotation: 0
            rotationVariation: 45
            rotationVelocity: 15
            rotationVelocityVariation: 15
            entryEffect:ImageParticle.Scale
        }
}

