//js implements interface logic solely

//all pages relevant to registration functionalities
const pages = {
    "login": "qrc:/forms/qml/register/Register.qml",
    "loginForm": "qrc:/forms/qml/register/LoginForm.qml",
    "registerForm": "qrc:/forms/qml/register/RegisterForm.qml",
    "studiesSelection": "qrc:/forms/qml/register/StudiesSelection.qml"
};

//sign up with icon filepaths
const signUpWith = {
    "google": "qrc:/forms/res/google.png",
    "facebook": "qrc:/forms/res/logo-facebook-png6.png",
    "instagram":"qrc:/forms/res/insta.png"
};

//signUpWith actions
function signUpWithIconClicked(source,user){
    if (source === signUpWith.google)
        console.log("Google")
    else if (source === signUpWith.facebook)
        console.log("Facebook")
    else
        console.log("Instagram")
}

//toogle between top header text in register.qml
function registerLoginHeaderTextToogle(source){
    const toogle = (!pages.loginForm.localeCompare(source))
    return (toogle) ? qsTr("Welcome") : qsTr("Please, register")
}

//animate username input field on focus changed
function onFocusChangedLoginInputField(usernameField,usernameInputRect) {
    if (usernameField.focus === true) {
        usernameInputRect.opacity = 1
        usernameInputRect.color = "transparent"
        usernameInputRect.border.width = 1.5
    }
    else if (!(usernameField.text.length > 0)){
        usernameInputRect.opacity = 0.5
        usernameInputRect.color = "#010708"
        usernameInputRect.border.width = 0
    }
    usernameInputRect.color = "#010708"
}

//open new page.qml item being opened must have a Page as root component
function addStackViewElement(pageName,model,navigationStack){
    var component = Qt.createComponent(pageName);
    var sprite = component.createObject(navigationStack,model);
    navigationStack.push(sprite)
}

//hide and show password logic
function showPassword(passwordField,passwordIcon){
    if (passwordField.echoMode === TextField.Password){ //show password
        passwordField.echoMode = TextField.Normal
        passwordIcon.text = "\uE802";
    }
    else{ //hide password
        passwordField.echoMode = TextField.Password
        passwordIcon.text = "\uE801";
    }
}

//function to retract textfield padding in rect when input is being entered
function onVisbleChangedToogleTextfieldLeftPadding(icon,textField){
    if (icon.visible === true){
        textField.leftPadding = 34
    }
    else textField.leftPadding = 10
}

//condition to check if textfield left and right icons should display
function displayLeftAndRightTextFieldIcons(m_textField,iconText){
    const condition = (m_textField.text.length === 0) && (iconText);
    return (condition) ? true : false
}



