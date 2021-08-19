//js implements interface logic solely

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
   // usernameInputRect.color = "#010708"
}

//open new page.qml item being opened must have a Page as root component
function addStackViewElement(pageName,model,navigationStack){
    var component = Qt.createComponent(pageName);
    var sprite = component.createObject(navigationStack,model);
    navigationStack.push(sprite)
}

//condition to check if textfield left and right icons should display
function displayLeftAndRightTextFieldIcons(m_textField,iconText){
    const condition = (m_textField.text.length === 0) && (iconText);
    return (condition) ? true : false
}

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

//toogle grades pick isActive
function selectedGrades(btn,grades){
    for (let i = 0; i < grades.length; i++)
        if (grades[i].isActive === true) grades[i].isActive = false
    btn.isActive = true
}

//function to push new page to navigation stack
function stackPushPage(url,pageId,stackId,properties){
    var component = Qt.createComponent(url);
    var sprite = component.createObject(pageId,properties)
    stackId.push(sprite)
}
