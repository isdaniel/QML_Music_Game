import QtQuick 2.0
import VPlay 2.0
import QtQuick.Particles 2.0
import "../newgui"
import "../scens"
Basescene{
    id:scene1
    width:480
    height:320
    Component.onCompleted:console.debug("遊戲開始~~~!")
    property string mytemple:""
    Protcet{
        id:earth
        x:scene1.width/2
        y:scene1.height/2
    }
    Image{
        x:scene1.width-scoreimg.width
        y:0
        id:scoreimg
        source:"../../assets/img/gamescens/score.png"
        width:180
        height:30
    }
    Item{
        z:4
        x:scene1.width/2
        y:scene1.height/2
        Image{
            anchors.centerIn:parent
            width:37
            height:15
            id:perfectimg
            source:"../../assets/img/gamescens/perfect.png"
            opacity:perfectopacity
        }
        Image {
            anchors.centerIn:parent
            width:30
            height:15
            id:greatimg
            source:"../../assets/img/gamescens/great.png"
            opacity:greatopacity
        }
        Image {
            anchors.centerIn:parent
            width:30
            height:15
            id:missimg
            source:"../../assets/img/gamescens/miss.png"
            opacity:missopacity
        }
        Timer{
            running:song1||song2||song3||song4||song5
            interval:50
            repeat:true
            onTriggered:{
                if(perfectopacity>0){perfectopacity-=0.1}
                if(missopacity>0){missopacity-=0.1}
                if(greatopacity>0){greatopacity-=0.1}
            }
        }
    }//遊戲中的Perfect,miss,great貼圖
    ImageButton{
        anchors.bottomMargin:5
        anchors.leftMargin:5
        anchors.bottom:parent.bottom
        anchors.left:parent.left
        visible:!press
        source:press? "../../assets/img/start.png":"../../assets/img/pause.png"
        onClicked:{
            if(press)
                playscensrect.opacity=0
            else{
                playscensrect.opacity=0.5
            }
            press=!press
        }
    }
    ScoreNumber{
        z:2
        y:10
        anchors.right:parent.right
        anchors.rightMargin:10
        number:score
    }//分數
    ComboNumber{
        anchors.right:parent.right
        anchors.rightMargin:30
        y:scene1.height/10
        number:clickbox
    }
    BulletTest{
        z:1
        id:box
    }
    Circlelight{
        id:circlelight
    }
    Life{
        z:2
    }
    Image{
        anchors.fill:parent
        z:-10
        id:backg
        source:"../../assets/img/startbg/start.jpg"
    }
    Image{
        id:pausemeun
        x:scene1.width/2-pausemeun.width/2
        y:press? scene1.height/2-pausemeun.height/2:-300
        z:3
        source:"../../assets/img/gamescens/pausemeun.png"
        width:240;
        height:130;
        Rectangle{
            z:-1
            opacity:0.7
            color:"black"
            anchors.centerIn:parent
            width:210
            height:100
        }
        NumberAnimation on y {
            duration:700
            from:-300
            to:scene1.height/2-pausemeun.height/2
            running:press
        }
    }//暫停的選單
    Row{
        z:4
        anchors.horizontalCenter: pausemeun.horizontalCenter
        anchors.verticalCenter: pausemeun.verticalCenter
        spacing:25
        SongButton{
            source:"../../assets/img/gamescens/continue.png"
            onClicked:{
                press=!press
            }
        }
        SongButton{
            source:"../../assets/img/gamescens/gotosong.png"
            onClicked:{
                entityManager.removeEntitiesByFilter(["monster2","monster3"])
                gameWindow.state="songs"
            }
        }
    }//暫停的選單
    Rectangle{
        id:playscensrect
        anchors.fill:parent
        z:2
        opacity:0
        color:"black"
    }//暫停黑幕

    //time text
    function timeChanged()  {
        if(press){
            alltimes=timetext
            starttimes=0;
        }
        else{
            var currentTime = new Date().getTime();
            timetext = (currentTime-starttimes)+alltimes;
        }
        if(starttimes==0)
        {
            starttimes = new Date().getTime();
        }
        //        if((currentTime-starttimes)+alltimes>=1800000)
        //            timecount.text="Successful"
        //        else{
        //            timecount.text=timetext
        //        }
        if(!press)
            playscensrect.opacity=0
        else{
            playscensrect.opacity=0.5
        }
        if(gameover==true)
        {
            playscensrect.opacity=0.5
        }
    }
    Timer{
        id: combotime
        interval: 20;
        running:song1||song2||song3||song4||song5
        repeat: true;
        onTriggered:timeChanged()
    }
    //    Text {
    //        id: timecount
    //        text: timetext
    //        font.pixelSize:30
    //        color: "white"
    //        y:scene1.height-100
    //    }
    // time text
    Rectangle{
        opacity:0.5
        border.color:"#FFFF77"
        border.width:1
        id:endgame
        x:scene1.width/2-endgame.width/2
        y:gameover? scene1.height/2-endgame.height/2:700
        height:245;
        width:220;
        z:3
        color:"black"
        NumberAnimation on y {
            duration:700
            from:700
            to:scene1.height/2-endgame.height/2
            running:gameover
        }
    }//結束的選單
    Image {
        z:4
        id:result
        source:"../../assets/img/gamescens/RESULT.png"
        anchors.bottom:endgame.top
        anchors.bottomMargin:-3
        anchors.left:endgame.left
        width:220
        height:22
    }
    Row{
        z:4
        anchors.horizontalCenter:endgame.horizontalCenter
        anchors.bottom:endgame.bottom
        anchors.verticalCenter:endgame.verticalCenter
        anchors.verticalCenterOffset:100
        spacing:15
        SongButton{
            source:"../../assets/img/gamescens/restart.png"
            onClicked:{
                if(song1==true)
                {
                music1.play()
                }
                if(song2==true)
                {
                music2.play()
                }
                if(song3==true)
                {
                music3.play()
                }
                if(song4==true)
                {
                music4.play()
                }
                if(song5==true)
                {
                music5.play()
                }
                reset();
                playscensrect.opacity=0;
            }
        }
        SongButton{
            source:"../../assets/img/gamescens/gotosong.png"
            onClicked:{
                entityManager.removeEntitiesByFilter(["monster2","monster3"])
                gameWindow.state="songs"
            }
        }
    }//結束遊戲

    Column{
        z:4
        anchors.horizontalCenter:endgame.horizontalCenter
        anchors.verticalCenter:endgame.verticalCenter
        anchors.verticalCenterOffset:-45
        spacing:35
        Image {
            width:130
            height:0.5
            opacity:0.5
            id:line1
            source:"../../assets/img/gamescens/line.png"
        }
        Image {
            width:130
            height:0.5
            opacity:0.5
            id:line2
            source:"../../assets/img/gamescens/line.png"
        }
        Image {
            width:130
            height:0.5
            opacity:0.5
            id:line3
            source:"../../assets/img/gamescens/line.png"
        }
    }
    Column{
        z:4
        anchors.verticalCenter:endgame.verticalCenter
        anchors.verticalCenterOffset:-40
        anchors.left:endgame.left
        anchors.leftMargin:15
        spacing:20
        Image {
            width:60
            height:15
            id:endprefectimg
            source:"../../assets/img/gamescens/perfect.png"
        }
        Image {
            x:15
            width:45
            height:15
            id:endgreatimg
            source:"../../assets/img/gamescens/great.png"
        }
        Image {
            x:30
            width:30
            height:15
            id:endmissimg
            source:"../../assets/img/gamescens/miss.png"
        }
        Image {
            x:-5
            width:90
            height:15
            id:maxcomboimg
            source:"../../assets/img/gamescens/max-combo.png"
        }
    }
    Column{
        z:4
        anchors.horizontalCenter:endgame.horizontalCenter
        anchors.verticalCenter:endgame.verticalCenter
        anchors.verticalCenterOffset:-40
        anchors.horizontalCenterOffset:-35
        spacing:15
        ShowScoreNumber{
            width:16
            height:20
            number:perfectcount
        }
        ShowScoreNumber{
            width:16
            height:20
            number:greatcount
        }
        ShowScoreNumber{
            width:16
            height:20
            number:misscount
        }
        RedScoreNumber{
            width:16
            height:20
            number:maxcombo
        }
    }

    Row{
        z:4
        anchors.horizontalCenter:endgame.horizontalCenter
        anchors.horizontalCenterOffset:-50
        anchors.bottom:endgame.bottom
        anchors.bottomMargin:60
        spacing:6
        Image {
            id:scoreend
            width:72
            height:20
            source:"../../assets/img/gamescens/scoreresult.png"
        }
        RedScoreNumber{
            id:scoreend1
            width:16
            height:20
            number:score
        }
    }
    ParticleSystem {
        z:-1
        id: sys
        ImageParticle {
            system: sys
            id:cp
            source: "../../assets/img/songmeun/glowdot.png"
            colorVariation: 0.4
            color: "#000000FF"
        }
        Emitter {
            //burst on click
            id: bursty
            system:sys
            enabled:clickbox>=3? 1:0
            x:earth.x
            y:earth.y
            emitRate:500+clickbox*200
            maximumEmitted:500+clickbox*200
            acceleration: AngleDirection {angleVariation: 360; magnitude: 180; }
            size: 8
            endSize: 16
            sizeVariation: 4
        }
    }
//    MouseArea {
//        anchors.fill:scene1
//        id: ma
//        onClicked:{
//            console.debug(mouse.x)
//            console.debug(mouse.y)
//        }
//    }
}


