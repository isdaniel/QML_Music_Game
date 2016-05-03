import VPlay 2.0
import QtQuick 2.0
import Qt.labs.settings 1.0
import "game1"
import "scens"
import Myscore 1.0
GameWindow {
    color:"black"
    licenseKey: "A7146495E6E61A21315008E2FA69CC8D51F3AD3CCC458A1509126814D7096B37233337C2BC4678FBA3915600D986D3552F4A0EF77F5B4D5D9E00A927A4306ED6B69A294B0ED379385C3D1CE89BBA31ED5C0970667C1C0C7251EF6FDC30DE4FBB810F5A23CA8DB382928C06A8ABEA5F82E2F1B4C0DE3D5DCF22CC30EDE2B7E53918A3341107BF3F2B9AFC0C84C29AD02F56AA0EDA8DEC775A13279853AA5F55F7F8663A51BB799D2F73FBB5521682BED2E548BA0FFDAA696307BB6BC3E4AEBFB0028F05178437251C4DFC694C191158E49DC53107F0C2A5D170140F119C36CFE34C59A5A963699C28EBFAF9281486A92ACFDC693365E78C24BF5408446291A0084AEF6F339344CC49636DF630B8EF72E75C2F55412DC42D4D469A9C09ADB2555E"
    id:gameWindow
    property double lifes: 1
    property int clickbox:0 //combo數
    property int score:0 //分數
    property bool press: false //判斷暫停
    property bool gameover:false //判斷是否gameover
    property bool song1:false //TestCreate
    property bool song2:false
    property bool song3:false //TestCreate
    property bool song4:false
    property bool song5:false
    property bool allsongs:false
    property double perfectopacity:0
    property double missopacity:0
    property double greatopacity:0

    property double timetext: 0
    property double starttimes: 0
    property double alltimes: 0

    property int i: 0

    property int perfectcount :0
    property int misscount:0
    property int greatcount:0
    property int maxcombo:0
    onLifesChanged:{
        if(lifes>1)
            lifes=1
        else if(lifes<=0)
            gameover=true
    }
    EntityManager{
        id:entityManager
        entityContainer:{
            playscene1;
        }
    }//EntityManager一個game只能有一個
    PhysicsWorld {
        id:physicsWorld
        debugDrawVisible:false
    }
    BackgroundMusic{
        id:startbackgroundmusic
        source:"../assets/audio/PlasticSky.mp3"
    }
    Mscore{
        id:myscore
    }
    PlayScene1{
        id:playscene1
    }
    BackgroundMusic{
        id:music1
        source:"../assets/audio/solitary.mp3"
    }
    BackgroundMusic{
        id:music2
        source:"../assets/audio/Last Horizon.mp3"
    }
    BackgroundMusic{
        id:music3
        source:"../assets/audio/truth.mp3"
    }
    BackgroundMusic{
        id:music4
        source:"../assets/audio/Art.mp3"
    }
    BackgroundMusic{
        id:music5
        source:"../assets/audio/Closed Eye.mp3"
    }
    Component.onCompleted:{
        music1.stop()
        music2.stop()
        music3.stop()
        music4.stop()
        music5.stop()
        startbackgroundmusic.play()
    }
    Startscens{
        id:startscens
        onStartPress:{
            gameWindow.state="songs"
        }
    }
    Songmeun{
        id:songmeun
        onStartPress:{
            gameWindow.state="play"
            song1=true
            allsongs=song1||song2||song3||song4||song5
        }
        onStartPress1:{
            gameWindow.state="play"
            song2=true
            allsongs=song1||song2||song3||song4||song5
        }
        onStartPress2:{
            gameWindow.state="play"
            song3=true
            allsongs=song1||song2||song3||song4||song5
        }
        onStartPress3:{
            gameWindow.state="play"
            song4=true
            allsongs=song1||song2||song3||song4||song5
        }
        onStartPress4:{
            gameWindow.state="play"
            song5=true
            allsongs=song1||song2||song3||song4||song5
        }
    }
    state:"startsed"
    activeScene:startscens
    states: [
        State {
            name:"startsed"
            PropertyChanges {
                target: startscens
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene:startscens
            }
        },
        State {
            name:"songs"
            PropertyChanges {
                target: songmeun
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene:songmeun
            }
        },
        State {
            name:"play"
            PropertyChanges {
                target: playscene1
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene:playscene1
            }
        }
    ]
    Settings{
        id:game1
        property int bestscore: 0
    }
    Settings{
        id:game2
        property int bestscore: 0
    }
    Settings{
        id:game3
        property int bestscore: 0
    }
    Settings{
        id:game4
        property int bestscore: 0
    }
    Settings{
        id:game5
        property int bestscore: 0
    }
    Timer  {
        id:everytime
        interval:16
        running:true
        repeat: true;
        onTriggered:everytimes()
    }
    function everytimes(){
        if(clickbox>maxcombo){
            maxcombo=clickbox;
        }
        if(gameWindow.state==="songs"){
            song1=false
            song2=false
            song3=false
            song4=false
            song5=false
            startbackgroundmusic.play()
            music1.stop()
            music2.stop()
            music3.stop()
            music4.stop()
        }
        if(gameWindow.state==="play"&&song1==true){
            startbackgroundmusic.stop()
            if(press==false&&gameover==false)
            {
                music1.play()
            }
            else
            {
                //console.debug("音樂暫停了!!!!!!!!!!!!!!!!!!!!")
                music1.pause()
            }
        }
        if(gameWindow.state==="play"&&song2==true){
            startbackgroundmusic.stop()
            if(press==false&&gameover==false)
            {
                music2.play()
            }
            else
            {
                //console.debug("音樂暫停了!!!!!!!!!!!!!!!!!!!!")
                music2.pause()
            }
        }
        if(gameWindow.state==="play"&&song3==true){
            startbackgroundmusic.stop()
            if(press==false&&gameover==false)
            {
                music3.play()
            }
            else
            {
                //console.debug("音樂暫停了!!!!!!!!!!!!!!!!!!!!")
                music3.pause()
            }
        }
        if(gameWindow.state==="play"&&song4==true){
            startbackgroundmusic.stop()
            if(press==false&&gameover==false)
            {
                music4.play()
            }
            else
            {
                //console.debug("音樂暫停了!!!!!!!!!!!!!!!!!!!!")
                music4.pause()
            }
        }
        if(gameWindow.state==="play"&&song5==true){
            startbackgroundmusic.stop()
            if(press==false&&gameover==false)
            {
                music5.play()
            }
            else
            {
                //console.debug("音樂暫停了!!!!!!!!!!!!!!!!!!!!")
                music5.pause()
            }
        }
    }
    function reset(){
        lifes=1
        clickbox=0
        score=0
        press=false
        gameover=false
        timetext=0
        starttimes=0
        alltimes=0
        i=0
        perfectcount=0
        misscount=0
        greatcount=0
        maxcombo=0
    }
}

