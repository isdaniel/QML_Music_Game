import VPlay 2.0
import QtQuick 2.0

Item {
    id: scorenumber
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

    onNumberChanged:{
        if(number > 1000000) number = 999999
        var trailingZero = true

        var unit = truncate((number / 100000) % 10)
        if((trailingZero && unit <= 0) || unit >= 10) {
            position100000.source = imagePath + "empty_big.png"
        } else {
            trailingZero = false
            position100000.source = imagePath + unit+".png"
        }

        var unit = truncate((number / 10000) % 10)
        if((trailingZero && unit <= 0) || unit >= 10) {
            position10000.source = imagePath + "empty_big.png"
        } else {
            trailingZero = false
            position10000.source = imagePath + unit+".png"
        }

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
        }
        else {
            position1.source = imagePath + unit+".png"
        }
    }
    Row {
        id: row
        height: position1.height
        x: number >= 100000 ? -1 : number >= 10000 ? -1 : number >= 1000 ? -1 : number >= 100 ? -1 : number >= 10 ? -1 : -1
        MultiResolutionImage {
            id: position1000000
            width:16
            height:20
            source: imagePath + "empty_big.png"
        }
        MultiResolutionImage {
            id: position100000
            width:16
            height:20
            source: imagePath + "empty_big.png"
        }
        MultiResolutionImage {
            id: position10000
            width:16
            height:20
            source: imagePath + "empty_big.png"
        }
        MultiResolutionImage {
            id: position1000
            width:16
            height:20
            source: imagePath + "empty_big.png"
        }
        MultiResolutionImage {
            id: position100
            width:16
            height:20
            source: imagePath + "empty_big.png"
        }
        MultiResolutionImage {
            id: position10
            width:16
            height:20
            source: imagePath + "empty_big.png"
        }
        MultiResolutionImage {
            id: position1
            width:16
            height:20
            source: imagePath + "0.png"
        }
    }
}

