import VPlay 2.0
import QtQuick 2.0
import QtQml.Models 2.1
import QtQuick.Particles 2.0
import "../newgui"
Basescene {
    id: scene
    width: 480
    height: 320
    signal startPress;
    signal startPress1;
    signal startPress2;
    signal startPress3;
    signal startPress4;
//    Text{
//        id:meunbest
//        color:"white"
//        text:"The Best:"
//        anchors.top:parent.top
//        anchors.topMargin:20
//        font.pixelSize:20
//        x:30
//    }
//    Text{
//        id:meunscore
//        color:"yellow"
//        anchors.top:parent.top
//        anchors.topMargin:20
//        anchors.left:meunbest.right
//        font.pixelSize:20
//        text:bests()
//    }


    Row{
        z:4
        anchors.bottom: parent.bottom
        anchors.horizontalCenterOffset: 20
        anchors.bottomMargin: 10
        Image {
            id:bestscoreend
            width:90
            height:20
            source:"../../assets/img/gamescens/bestscore.png"
        }
        RedScoreNumber{
            id:bestscoreend1
            width:16
            height:20
            number:bests()

           }
      }
//            Timer{
//                running:true
//                repeat: true;
//               interval:500;
//               onTriggered: {
//               }
//            }


    function bests(){
        if(view.currentIndex==0)
           return game1.bestscore
        else if(view.currentIndex==1)
           return game2.bestscore;
        else if(view.currentIndex==2)
           return game3.bestscore;
        else if(view.currentIndex==3)
           return game4.bestscore;
        else if(view.currentIndex==4){
           return game5.bestscore;
        }
        else{
           return 0;
        }
    }
    Image{
        id:bar
        x:325
        y:144
        width:155
        height: 45
        source:"../../assets/img/songmeun/bar.png"
        smooth: true
        opacity: 0.1
    }
    Image {
        id:startcircle
        x:-50
        y:-115
        width:350
        height:350
        opacity:0.3
        rotation:10000
        source:"../../assets/img/startbg/startcitcle.png"
    }
    Image {
        id:startcirclesmall
        x:-100
        y:170
        width:310
        height:300
        opacity:0.15
        source:"../../assets/img/startbg/maxcircle.png"
    }
    Timer{
        running:gameWindow.state==="songs"
        interval:40
        repeat:true
        onTriggered:{
            startcircle.rotation-=2
            startcirclesmall.rotation+=5
            if(startcircle.rotation<=0)startcircle.rotation=10000
            if(startcirclesmall.rotation>=10000)startcirclesmall.rotation=0
        }
    }
    BackgroundImage{
        z:-2
        id:bgPicChange
        width: 480
        height: 320
        source: "../../assets/img/startbg/start.jpg"
        smooth: true
//        NumberAnimation on opacity {
//            id: createAnimation
//            from: 0.5
//            to: 1
//            duration:500
//        }
//        Component.onCompleted: createAnimation.start()
    }
    PathView {
        id: view
        focus: true
        snapMode: PathView.SnapToItem
        model: myModel
        delegate: myDelegate
        path: myPath
        anchors.fill: parent
        interactive: true
        pathItemCount:5
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: PathView.StrictlyEnforceRange
        flickDeceleration: 20
    }

    Path {
        id: myPath
        startX: 340; startY:5

        PathLine{x:340; y:5}
        PathAttribute{name:"scale";value:0.5}
        PathAttribute{name:"opacity";value:0.3}

        PathQuad{x:400; y: 150; controlX: 400; controlY: 80}
        PathAttribute{name:"scale";value:0.8}
        PathAttribute{name:"opacity";value:0.5}

        PathLine{x:395; y: 165}
        PathAttribute{name:"scale";value:1.2}
        PathAttribute{name:"opacity";value:1}

        PathLine{x:400; y: 170}
        PathAttribute{name:"scale";value:0.8}
        PathAttribute{name:"opacity";value:0.5}

        PathQuad{x:340; y: 330; controlX: 400; controlY: 240}
        PathAttribute{name:"scale";value:0.5}
        PathAttribute{name:"opacity";value:0.3}

    }
    Component {
        id: myDelegate
        Item{
            scale: PathView.scale
            opacity:PathView.opacity
            width: 210
            height: 35
            visible: PathView.onPath
            SongButton{
                id:startbutton
                width:120
                height:28
                anchors.centerIn:parent
                source:startbuttons();
                onClicked:{view.currentIndex=index;}
                onDoubleclick:{
                    if(view.currentIndex==index&&index==0)
                      {startPress();reset()}
                    else if(view.currentIndex==index&&index==1)
                      {startPress1();reset()}
                    else if(view.currentIndex==index&&index==2)
                      {startPress2();reset()}
                    else if(view.currentIndex==index&&index==3)
                      {startPress3();reset()}
                    else if(view.currentIndex==index&&index==4)
                      {startPress4();reset()}
                }
            }
            Image {
                id:songstart1
                opacity:showpoint()
                width:10
                height:10
                anchors.verticalCenter:parent.verticalCenter
                anchors.verticalCenterOffset:0
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.horizontalCenterOffset:60
                source: "../../assets/img/songmeun/point.png"
            }
            Image {
                id:songstart2
                opacity:showpoint()
                width:10
                height:10
                anchors.verticalCenter:parent.verticalCenter
                anchors.verticalCenterOffset:0
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.horizontalCenterOffset:67
                source: "../../assets/img/songmeun/point.png"
            }
            Image {
                id:songstart3
                opacity:0
                width:10
                height:10
                anchors.verticalCenter:parent.verticalCenter
                anchors.verticalCenterOffset:0
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.horizontalCenterOffset:74
                source: "../../assets/img/songmeun/point.png"
            }
            function showpoint(){
                if(view.currentIndex==index)
                   return 1;
                else
                   return 0
            }//難度的星星
            function startbuttons(){
                if(view.currentIndex==index)
                    return "../../assets/img/songmeun/Play_red"+index+".png";
                else
                    return "../../assets/img/songmeun/Play"+index+".png"
            }//song裡button的顏色
        }//Item
    }
    ListModel {
        id: myModel
        ListElement {my:""}
        ListElement {my:""}
        ListElement {my:""}
        ListElement {my:""}
        ListElement {my:""}
    }
    onBackButtonPressed: {
        gameWindow.state="startsed"
    }
    Emitter {
         id: emitter
         width:scene.width;
         y:scene.height+20
         system: particleSystem
         lifeSpan:6400
         lifeSpanVariation:400
         size:8
         velocity: AngleDirection {
             angle: 270
             angleVariation: 15
             magnitude: 100
             magnitudeVariation: 50
         }
     }
     ParticleSystem {
         id: particleSystem
     }
     ImageParticle {
         z:-1
         source: "../../assets/img/songmeun/glowdot.png"
         color:"#AAAAAA"
         system: particleSystem
         colorVariation: 0.2
         rotation: 0
         rotationVariation: 45
         rotationVelocity: 15
         rotationVelocityVariation: 15
         entryEffect:ImageParticle.Scale
     }
}
//      glowdot
//    ParticleSystem {
//        id: particleSystem
//    }
//    Emitter {
//        id: emitter
//        anchors.fill:parent
//        system: particleSystem
//        emitRate: 35
//        lifeSpan: 1000
//        lifeSpanVariation: 500
//        size: 4
//        endSize: 6
//    }
//    ImageParticle {
//        z:-2
//        source: "../../assets/img/startbg/sky.png"
//        system: particleSystem
//        colorVariation: 0.2
//        rotation: 0
//        rotationVariation: 45
//        rotationVelocity: 15
//        rotationVelocityVariation: 15
//        entryEffect:ImageParticle.Scale
//    }



