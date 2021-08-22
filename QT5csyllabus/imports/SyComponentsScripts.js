//all fontello icon label codes
const fontello = {
    "user": "\uE803",
    "email": "\uF0e0",
    "lock": "\uE804",
    "phone": "\uE805",
    "close": "\uE800",
    "eye": "\uE801",
    "eyeOff": "\uE802",
    "busy": "\uE839",
    "arrowDown": "\uE806",
    "thLarge": "\uE80d",
    "heart": "\uE80c",
    "search": "\uE80e",
    "apple": "\uF179",
    "calendar": "\uE811",
    "video": "\uE80f",
    "home": "\uE810",
    "userEdit": "\uE812"
};

//all regex used in application
const regex = {
    "phoneNumber": /\d{1,11}(?:,\d{1,11})+$/,
    "emailAddress": /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
};

//hide show password logic and cancel text in SyTextField
function toggleSyTextFieldRightIcon(syTextField){
    if (syTextField.rightIcon === fontello.eye){
        syTextField.echoMode = TextField.Normal
        syTextField.rightIcon = fontello.eyeOff
    }
    else if (syTextField.rightIcon === fontello.eyeOff){
        syTextField.echoMode = TextField.Password
        syTextField.rightIcon = fontello.eye
    }
    else { syTextField.text = "" }
}

//return navBar model
function getNavBarIcons(){
    return [fontello.video,fontello.home,fontello.calendar,fontello.userEdit]
}

//return home views options
function getHomeViewOptions(){
    return ["Syllabus","Education","Quotes"]
}

//change copyright msg horizontal alignment when width higher than 900
function changeCopyrightHorizontalAlignment(width){
    if (width > 900) return Text.AlignHCenter
    else return Text.AlignLeft
}



//create qml component filename
function createSpriteObjects(filename,appWindow,properties) {
    const pageComponent = Qt.createComponent(filename);
    if (pageComponent.status === Component.Ready)
        finishCreation(pageComponent,appWindow,properties);
    else
        pageComponent.statusChanged.connect(finishCreation);
    return pageComponent
}

//instantiate qml component
function finishCreation(pageComponent,appWindow,data) {
    if (pageComponent.status === Component.Ready) {
        const sprite = pageComponent.createObject(appWindow, data);
        if (sprite === null)
            console.log("Error creating object");
        return sprite
    } else if (pageComponent.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", pageComponent.errorString());
    }
    return null
}
