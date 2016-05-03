import QtQuick 2.3
import VPlay 2.0
import "../game1"
import "../Position.js" as Position
import "../Templejs1.js" as Temples1
import "../Templejs2.js" as Temples2
import "../Templejs3.js" as Temples3
import "../Templejs4.js" as Temples4
import "../Templejs5.js" as Temples5

Item {
    //    Component {
    //        id: monster2
    //        EntityBaseDraggable {
    //            property bool colliderearth: false  //判定圓環碰撞
    //            property bool run: true  //長案的判斷
    //            property double startTime: 0 //time
    //            property int secondsElapsed: 0 //time
    //            property int alltime:0 //計算音符時間
    //            entityType: "monster2"
    //            Image{
    //                width: 32
    //                height:32
    //                id: monsterImage
    //                source: "../../assets/img/11.png"
    //            }
    //            NumberAnimation on x {
    //                duration:3000
    //                from:utils.generateRandomValueBetween(0,scene1.width)
    //                to:scene1.width/2
    //                paused:press//bool偵測
    //                running:run
    //            }
    //            NumberAnimation on y {
    //                duration: 3000
    //                from: -100 //上面出現音符
    //                to: scene1.height/2
    //                paused:press
    //                running:run
    //            }
    //            CircleCollider{
    //                x:monsterImage.x+10
    //                y:monsterImage.y+10
    //                radius:monsterImage.width*0.3
    //                collisionTestingOnlyMode: true
    //            }
    //            MouseArea{
    //                anchors.fill: monsterImage
    //                onPressAndHold:{
    //                    if(colliderearth==true){
    //                        removeEntity()
    //                        clickbox++
    //                        lifes=lifes+0.05
    //                        boxSound.play()
    //                        score+=100002
    //                    }
    //                }
    //                onPressed:{
    //                    if(colliderearth==true){
    //                        run=false
    //                    }
    //                }
    //                onReleased:{
    //                    removeEntity()
    //                }
    //                function timeChanged()  {
    //                    if(press){
    //                        alltime=secondsElapsed
    //                        startTime=0;
    //                    }
    //                    else{
    //                        var currentTime = new Date().getTime();
    //                        secondsElapsed = (currentTime-startTime)+alltime;
    //                    }
    //                    if(startTime==0)
    //                    {
    //                        startTime = new Date().getTime();
    //                    }
    //                }
    //                Timer  {
    //                    id: combotime
    //                    interval:16;
    //                    running:song1
    //                    repeat: true;
    //                    onTriggered:timeChanged()
    //                }
    //                Text {
    //                    id: counterText
    //                    text: secondsElapsed
    //                }
    //            }
    //        }//monster1
    Component {
        id: monster3
        EntityBaseDraggable {
            property bool wasclicked: false //判斷只背按一次
            property double startTime: 0 //time
            property int secondsElapsed: 0 //time
            property int alltime:0 //計算音符時間
            entityType: "monster3"
            MultiResolutionImage{
                id: monsterImage
                source: "../../assets/img/22.png"
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.verticalCenter:parent.verticalCenter
            }
            NumberAnimation on x{
                duration:3000
                from:mosterX()
                to: earth.x // move the monster to the left side of the screen
                paused:press
            }
            function mosterX(){
                if(song1==true){
                    return Position.positionX[Temples1.tmeple[(i+1)]];
                }
                else if(song2==true){
                    return Position.positionX[Temples2.tmeple[(i+1)]];
                }
                else if(song3==true){
                    return Position.positionX[Temples3.tmeple[(i+1)]];
                }
                else if(song4==true)
                    return Position.positionX[Temples4.tmeple[(i+1)]];
                else if(song5==true)
                    return Position.positionX[Temples5.tmeple[(i+1)]];
                else
                    return Position.positionX[Temples5.tmeple[(i+1)]];
            }
            NumberAnimation on y {
                duration:3000
                from:mosterY()
                to: earth.y
                paused:press
            }
            function mosterY(){
                if(song1==true){
                    return Position.positionY[Temples1.tmeple[(i+1)]];
                }
                else if(song2==true){
                    return Position.positionY[Temples2.tmeple[(i+1)]];
                }
                else if(song3==true){
                    return Position.positionY[Temples3.tmeple[(i+1)]];
                }
                else if(song4==true)
                    return Position.positionY[Temples4.tmeple[(i+1)]];
                else if(song5==true)
                    return Position.positionY[Temples5.tmeple[(i+1)]];
                else
                    return Position.positionY[Temples5.tmeple[(i+1)]];
            }
            SequentialAnimation {
                running: allsongs
                loops: Animation.Infinite
                NumberAnimation {
                    target: monsterImage
                    duration: utils.generateRandomValueBetween(0,1200)
                    property: "opacity"
                    to:0.4
                }
                NumberAnimation {
                    target: monsterImage
                    duration: utils.generateRandomValueBetween(0,1500)
                    property: "opacity"
                    to:1
                }
            }
            CircleCollider{
                radius:monsterImage.width*0.3
                x:monsterImage.x+10
                y:monsterImage.y+10
                collisionTestingOnlyMode: true
            }
            MultiPointTouchArea{
                id:touchpoint
                anchors.fill:monsterImage
                minimumTouchPoints:1
                maximumTouchPoints:3
                onPressed:{
                    if(secondsElapsed<=2150&&secondsElapsed>=2050){
                        if(wasclicked==false){
                            clickbox++
                            lifes=lifes+0.05
                            boxSound.play()
                            wasclicked=true
                            score+=(1000000/(Temples1.tmeple.length/2))
                            removeEntity()
                            perfectopacity=1;
                            perfectcount++;
                        }
                    }
                    else if(secondsElapsed<=2250&&secondsElapsed>=1850)
                    {
                        if(wasclicked==false){
                            clickbox++
                            lifes=lifes+0.02
                            boxSound.play()
                            wasclicked=true
                            score+=(1000000/(Temples1.tmeple.length/2))*0.75
                            removeEntity()
                            greatopacity=1;
                            greatcount++;
                        }
                    }
                    else{
                        removeEntity()
                        missopacity=1
                        clickbox=0
                        wasclicked=true
                        misscount++
                    }
                }
            }
            function timeChangeds()  {
                if(press){
                    alltime=secondsElapsed
                    startTime=0;
                }
                else{
                    var currentTime = new Date().getTime();
                    secondsElapsed = (currentTime-startTime)+alltime;
                }
                if(startTime==0)
                {
                    startTime = new Date().getTime();
                }
            }
            Timer{
                id: combotime
                interval:16;
                running:allsongs
                repeat: true;
                onTriggered:timeChangeds()
            }
        }
    }//monster
    Timer{
        id:gameoverorstart
        running:allsongs
        repeat:true
        interval:1
        onTriggered:overorstart()
    }
    function overorstart(){
        if(lifes<=0){
            music1.stop()
            entityManager.removeEntitiesByFilter(["monster3"])
            if(score>=game1.bestscore&&song1==true){
                game1.bestscore=score
            }
            else if(score>=game2.bestscore&&song2==true){
                game2.bestscore=score
            }
            else if(score>=game3.bestscore&&song3==true){
                game3.bestscore=score
            }
            else if(score>=game4.bestscore&&song4==true){
                game4.bestscore=score
            }
            else if(score>=game5.bestscore&&song5==true){
                game5.bestscore=score
            }
        }
        if(press==false&&gameover==false&&allsongs){
            if(song1==true){
                if(timetext>=(Temples1.tmeple[i]-2300)&&timetext<=(Temples1.tmeple[i]-2300)+30000)
                {
                   // console.debug("created at "+timetext)
                    entityManager.createEntityFromComponent(monster3)
                    i=i+2;
                }
            }
            if(song2==true){
                if(timetext>=(Temples2.tmeple[i]-4730)&&timetext<=(Temples2.tmeple[i]-4730)+30000)
                {
                    //console.debug("created at "+timetext)
                    entityManager.createEntityFromComponent(monster3)
                    i=i+2;
                }
            }
            if(song3==true){
                if(timetext>=(Temples3.tmeple[i]-2300)&&timetext<=(Temples3.tmeple[i]-2300)+30000)
                {
                    //console.debug("created at "+timetext)
                    entityManager.createEntityFromComponent(monster3)
                    i=i+2;
                }
            }
            if(song4==true){

                if(timetext>=(Temples4.tmeple[i]-2300)&&timetext<=(Temples4.tmeple[i]-2300)+30000)
                {
                    //console.debug("created at "+timetext)
                    entityManager.createEntityFromComponent(monster3)
                    i=i+2;
                }
            }
            if(song5==true){

                if(timetext>=(Temples5.tmeple[i]-2300)&&timetext<=(Temples5.tmeple[i]-2300)+30000)
                {
                   //console.debug("created at "+timetext)
                    entityManager.createEntityFromComponent(monster3)
                    i=i+2;
                }
            }

        }
    }
    SoundEffectVPlay {
        id: boxSound
        source: "../../assets/audio/boxCollision.wav"
    }
}




