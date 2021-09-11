.pragma library

//all pages relevant to registration functionalities
const images = {
    "appleLogo": "qrc:/images/forms/images/apple_white.png",
    "googleLogo": "qrc:/images/forms/images/google.png",
    "logo": "qrc:/images/forms/images/e-logo.png",
    "home": "qrc:/images/forms/images/icon-home.png",
    "calendar":"qrc:/images/forms/images/icons/calendar.svg",
    "heart": "qrc:/images/forms/images/icon-heart.png",
    "posterBg": "qrc:/images/forms/images/poster2_bg.png",
    "topPicks": "qrc:/images/forms/images/art-math.png",
    "avatar": "qrc:/images/forms/images/avatar.png",
    "camera": "qrc:/images/forms/images/camera.png",
    "plus": "qrc:/images/forms/images/icons/plus.svg",
    "highlight": "qrc:/images/forms/images/icons/format-color-highlight.svg",
    "dotsVertical": "qrc:/images/forms/images/icons/dots-vertical.svg",
    "eventAvailable": "qrc:/images/forms/images/icons/event-available.svg",
    "checkCircle": "qrc:/images/forms/images/icons/check-circle.svg"
};


//all regex used in application
const regex = {
    "phoneNumber": /\d{1,11}(?:,\d{1,11})+$/,
    "emailAddress": /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
};

//all icons fontello code https://fontello.com/
const fontello = {
    "user": "\uE803",
    "mail": "\uE813",
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
    "userEdit": "\uE812",
    "left": "\uE807",
    "star": "\uE814",
    "right": "\uE808",
    //stopped working at this point
    "play": "\uE816",
    "camera": "\uE815",
    "plus": "\uE818"
};


//login register errors
const errors = {
    "passwordMismatch": "Passwords must match.",
    "incorrectCredentials": "Invalid username or password.",
    "emptyField": "Field cannot be emty."
};

//navbar icons
const syNavBarIcons = {
    "logo": images.logo,
    "home": images.home,
    "calendar": images.calendar,
    "heart": images.heart
};

const materialColorCodes = {
    "red": "#F44336",
    "purple": "#9C27B0",
    "blue": "#2196F3",
    "orange": "#FF9800",
    "teal": "#009688",
    "cyan": "#00BCD4",
    "brown": "#795548",
    "indigo": "#3F51B5",
    "bluegrey": "#607D8B"
};



//return navBar model
function getNavBarIcons(){
    return [fontello.video,fontello.iconHome,fontello.calendar,fontello.userEdit]
}

//function compare strings
function compareStrings(first,second){
   return first === second
}

//change current navigation index
function changeNavBarIndex(source){
    const model = getSyNavBarModel()
    for (let i = 0; i < model.length; i++){
        if (source === model[i])
            changeToNavigation(i)
    }
}

//return profile student grid layout model
function getProfileStudentGridModel(){
    const data = [{'label': 'Student number','data': 'T0112609'},{'label': 'Academic year','data': '2021-2022'},{'label': 'Course','data': 'Civil Engineering'},{'label': 'Years study','data': '1st Graduate'},{'label': 'Admission date','data': '21 Sept 2020'},{'label': 'Graduation date (predicted)','data': '07 July 2023'}]
    return data;
}

//return profile contact details model
function getProfileContactGridModel(){
    const data = [{'label': 'Parent mail','data': 'T0112609'},{'label': 'Academic year','data': '2021-2022'},{'label': 'Course','data': 'Civil Engineering'},{'label': 'Years study','data': '1st Graduate'},{'label': 'Admission date','data': '21 Sept 2020'},{'label': 'Graduation date (predicted)','data': '07 July 2023'}]
    return data;
}
