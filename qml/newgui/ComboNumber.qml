import VPlay 2.0
import QtQuick 2.0

Item {
    id: numbers
    width: row.width
    height: row.heigt
    property string color
    property int number: 0

    property string imagePath: "../../assets/img/combos/"
    function truncate(_value)
    {
        if (_value<0) return Math.ceil(_value);
        else return Math.floor(_value);
    }

    onNumberChanged: {
        if(number > 9999) number = 9999
        var trailingZero = true

        var unit = truncate((number / 1000) % 10)
        if((trailingZero && unit <= 0) || unit >= 10) {
            position1000.source = imagePath + "empty_big.png"
        } else {
            trailingZero = false
            position1000.source = imagePath + unit+".png"
        }

        unit = truncate((number / 100) % 10)
        if((trailingZero && unit <= 0) || unit >= 10) {
            position100.source = imagePath + "empty_big.png"
        } else {
            trailingZero = false
            position100.source = imagePath + unit+".png"
        }

        unit = truncate((number / 10) % 10)
        if((trailingZero && unit <= 0) || unit >= 10) {
            position10.source = imagePath + "empty_big.png"
        } else {
            position10.source = imagePath + unit+".png"
        }

        unit = truncate(number % 10)
        // test also if there is remainder, if no remainder it might be 10 and the first number is needed, otherwise a fragment is displayed.
        if(number % 10 && ((trailingZero && unit <= 0) || unit >= 10)) {
            position1.source = imagePath + "empty_big.png"
        } else {
            position1.source = imagePath + unit+".png"
        }

        if(number <= 0) {
            position1.source = imagePath + "0"+".png"
        }
    }

    Row {
        id: row
        height: position1.height
        x: number >= 1000 ? -12 : number >= 100 ? -24 : number >= 10 ? -36 : -48
        MultiResolutionImage {
            id: position1000
            source: imagePath + "empty_big.png"
            width:20
            height:23
        }
        MultiResolutionImage {
            id: position100
            source: imagePath + "empty_big.png"
            width:20
            height:23
        }
        MultiResolutionImage {
            id: position10
            source: imagePath + "empty_big.png"
            width:20
            height:23
        }
        MultiResolutionImage {
            id: position1
            opacity:number<5 ? 0:1
            source: imagePath + "empty_big.png"
            width:20
            height:23
        }
    }
    MultiResolutionImage{
        anchors.left:row.right
        anchors.bottom:row.bottom
        opacity:number<5 ? 0:1
        id:comboimg
        source:imagePath+"combo.png"
        width:43
        height:12
    }
}

