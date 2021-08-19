//all pages relevant to registration functionalities
const pages = {
    "homePage": "qrc:/forms/qml/HomePage.qml",
    "loginForm": "qrc:/forms/qml/LoginForm.qml",
    "registerForm": "qrc:/forms/qml/RegisterForm.qml",
    "studiesSelection": "qrc:/forms/qml/StudiesSelection.qml",
    "courseSelection": "qrc:/forms/qml/CoursesSelection.qml",
    "busy": "qrc:/forms/qml/components/SyBusy.qml"
};

//sign up with icon filepaths
const signUpWith = {
    "google": "qrc:/forms/images/google.png",
    "facebook": "qrc:/forms/images/logo-facebook-png6.png",
    "instagram":"qrc:/forms/images/insta.png"
};

//all regex used in application
const regex = {
    "phoneNumber": /\d{1,11}(?:,\d{1,11})+$/,
    "emailAddress": /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
};

//all icons fontello code https://fontello.com/
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
    "shelf": "\uE80d",
    "heart": "\uE80c",
    "search": "\uE80e"
};


//login register errors
const errors = {
    "passwordMismatch": "Passwords must match.",
    "incorrectCredentials": "Invalid username or password.",
    "emptyField": "Field cannot be emty."
};

//navbar icons
const syNavBarIcons = {
    "iconHome": "qrc:/forms/images/icon-home.png",
    "thLarge": "qrc:/forms/images/th-large.png",
    "etangisiLogo": "qrc:/forms/images/e-logo.png"
};

//function to return all icons in navbar
function getSyNavBarModel(){
    return  [syNavBarIcons.iconHome,syNavBarIcons.thLarge,syNavBarIcons.etangisiLogo]
}

//function compare strings
function compareStrings(first,second){
   return first === second
}

//function change from current naviation index
function changeToNavigation(index){
    console.log(index)
}

//change current navigation index
function changeNavBarIndex(source){
    const model = getSyNavBarModel()
    for (let i = 0; i < model.length; i++){
        if (source === model[i])
            changeToNavigation(i)
    }
}
