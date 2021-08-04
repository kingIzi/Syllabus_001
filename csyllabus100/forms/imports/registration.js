//js implements interface logic solely

//all pages relevant to registration functionalities
const pages = {
    "login": "qrc:/forms/qml/register/Register.qml",
    "loginForm": "qrc:/forms/qml/register/LoginForm.qml",
    "registerForm": "qrc:/forms/qml/register/RegisterForm.qml",
    "studiesSelection": "qrc:/forms/qml/register/StudiesSelection.qml",
    "busy": "qrc:/forms/qml/SyBusy.qml"
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
    "arrowDown": "\uE806"
};

const errors = {
    "passwordMismatch": "Passwords must match.",
    "incorrectCredentials": "Invalid username or password.",
    "emptyField": "Field cannot be emty."
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
function onSyTextFieldFocusChanged(usernameField,usernameInputRect) {
    if (usernameField.focus === true) {
        usernameInputRect.opacity = 1
        usernameInputRect.color = "transparent"
        usernameInputRect.border.width = 1.5
    }
    else if (!(usernameField.text.length > 0)){
        usernameInputRect.opacity = 0.6
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

//hide show password logic and cancel text in SyTextField
function toggleSyTextFieldRightIcon(syTextFieldRect,syTextField){
    if (syTextFieldRect.rightIcon === fontello.eye){
        syTextField.echoMode = TextField.Normal
        syTextFieldRect.rightIcon = fontello.eyeOff
    }
    else if (syTextFieldRect.rightIcon === fontello.eyeOff){
        syTextField.echoMode = TextField.Password
        syTextFieldRect.rightIcon = fontello.eye
    }
    else { syTextFieldRect.field.text = "" }
}

//return email address or phone number regex
function getTextFieldRegex(name){
    for (let key in regex){
        if (key !== name) continue
        else return regex[key]
    }
}

//SyTextField is password input when rightIcon is fontello.eye or fontello.eyeOff
function isPasswordSyTextField(rightIcon){
    return ((rightIcon === fontello.eye) || (rightIcon === fontello.eyeOff))
}

//disable syTextField validator for password input
function setSyTextFieldValidator(rightIcon,syTextField){
    if (isPasswordSyTextField(rightIcon))
        syTextField = null
}

//validate register form
function isValidSignUpForm(telephoneInputRect,emailInputRect,createPassword,confirmPassword){
    const phoneAndEmail = isEmptyRegisterForm([telephoneInputRect,emailInputRect,createPassword,confirmPassword])
    const isMatch = ((createPassword.field.text === confirmPassword.field.text))
    if (!isMatch) {
        createPassword.showErrorMessage(errors.passwordMismatch)
        confirmPassword.showErrorMessage(errors.passwordMismatch)
    }
    return (isMatch && phoneAndEmail)
}

//verify that there are no empty values in register form
function isEmptyRegisterForm(syTextFields){
    let empty = false
    for (let i = 0; i < syTextFields.length; i++){
        if (syTextFields[i].field.text.length === 0){
            syTextFields[i].showErrorMessage(errors.emptyField)
            empty = true
        }
        else{
            syTextFields[i].hideErrorMessage()
        }
    }
    return !empty
}

//sign up user
function onRegisterClicked(telephoneInputRect,emailInputRect,createPassword,confirmPassword){
    const isValidForm = isValidSignUpForm(telephoneInputRect,emailInputRect,createPassword,confirmPassword)
    if (isValidForm){

    }
}

//show hide busy indicatoe
function showIsBusy(isBusy,loader,filename) {
    if (isBusy && filename.length !== 0){
        loader.source = ""
        loader.sourceComponent = busy
    }
    else {
        loader.sourceComponent = undefined
        loader.source = filename
    }
}
