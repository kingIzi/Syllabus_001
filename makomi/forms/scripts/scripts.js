//switch navBar right items for correct action
function switchNavBarAction(source,icons,navBar){
    switch (source){
    case icons.search.toString():
        navBar.searchClicked();
        break;
    case icons.filter.toString():
        navBar.filterClicked()
        break
    default:
        return
    }
}

//get search and filter icons in navBar
function getSearchFilterNavBarRightItems(icons){
    return [icons.search,icons.filter]
}

//get syllabus details options
function getSyllabusDetailsPageActionLabels(){
    return ["Read","Add to favorites"]
}

//side navigation icons
function getSideNavIcons(icons){
    return [icons.home,icons.favorite,icons.quiz,icons.accountCircle]
}

//faviorite nav bar right items
function getFavoritePageRightNavBArIcons(icons){
    return [icons.edit,icons.add]
}

//side nav labels
function getSideNavLabels(){
    return ["Home","Favorites","Did You Know!","My Account"]
}

//get reading page navigation bar icons
function getReadingPageNavBarRightIcons(icons){
    return [icons.openInNew]
}

//handle reading page right item actions
function readingPageActions(readingPage){
    console.log(readingPage.filename)
}

//append side navigation list model
function appendSideNavListModel(sideNavListModel,constantIcons){
    const labels = getSideNavLabels()
    const icons = getSideNavIcons(constantIcons)
    for (let i = 0; i < labels.length; i++){
        sideNavListModel.append({"iconImage": icons[i],"label": labels[i]})
    }
}

//handle sidenav item clicked
function onSideNavItemClicked(appLoader,index,navigations){
    switch (index){
    case navigations.Login:
        appLoader.sourceComponent = appLoader.allNavigations[navigations.Login]
        break
    default:
        appLoader.sourceComponent = appLoader.allNavigations[index]
        appLoader.navigationChanged(index)
        break
    }
}

//toogle syllabus book action
function toogleSyllabusDetailActions(isFavorite,btn){
    if (isFavorite){
        btn.text = "Remove from favorites"
    }
    else {
        btn.text = "Add To favorite"
    }
}

//handle account actions
function openAccountPage(userSettingsRepeater,userSettingColumn,userSettingsActionRepeater,accountSettingsAction){
    const isUserSetting = (userSettingsRepeater.itemAt(0) === userSettingColumn)
    if (isUserSetting){
        if ((userSettingsActionRepeater.itemAt(0) === accountSettingsAction)){
            userSettingsRepeater.pushAccountsPage()
        }
        else{
            userSettingsRepeater.pushSecurityPage()
        }
    }
    else{
        if ((userSettingsActionRepeater.itemAt(0) === accountSettingsAction)){
            userSettingsRepeater.pushCoursesPage()
        }
        else{
            userSettingsRepeater.pushSubscriptionPage()
        }
    }
}

//all signals
const signals = {
    //on navigation item changed
    onNavigationChanged: function(index,navigationBar) {
        const indexes = 4 // total number of items in the side navigation
        if (index <= (indexes - 1) && index >= 0){
            const listModel = navigationBar.sideNavigation.model
            navigationBar.title = listModel.get(index).label
            if (navigationBar.sideNavigation.currentIndex !== index){
                navigationBar.sideNavigation.currentIndex = index
            }
        }
    }
};

