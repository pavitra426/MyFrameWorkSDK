function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function RChange(src) {
    console.log(src.value);
}

function CreateAlert(title, desciption, ButtonList) {
    var AlertDialogContainer = document.createElement("div");
    AlertDialogContainer.classList.add("Alert-Dialog-Container");
    
    var AlertDialog = document.createElement("div");
    AlertDialog.classList.add("Alert-Dialog");
    AlertDialogContainer.appendChild(AlertDialog);
    
    var AlertHead = document.createElement("div");
    AlertHead.classList.add("Alert-Head");
    AlertHead.innerHTML = title;
    AlertDialog.appendChild(AlertHead);
    
    var AlertDescription = document.createElement("div");
    AlertDescription.classList.add("Alert-Description");
    AlertDescription.innerHTML = desciption;
    AlertDialog.appendChild(AlertDescription);
    
    var AlertNavArea = document.createElement("div");
    AlertNavArea.classList.add("Alert-Nav-Area");
    AlertDialog.appendChild(AlertNavArea);
    
    var AlertButtonArea = document.createElement("div");
    AlertButtonArea.classList.add("Alert-Button-Area");
    AlertNavArea.appendChild(AlertButtonArea);

    for (let i = 0; i < ButtonList.length; i++) {
        var AlertClickableText = document.createElement("div");
        AlertClickableText.classList.add("Alert-clickable-text");
        AlertClickableText.innerHTML = ButtonList[i];

            AlertButtonArea.appendChild(AlertClickableText);
    }

    document.getElementsByTagName("body")[0].appendChild(AlertDialogContainer);
}

function ChangeStyle(ForID, PropertyList, ValueList) {
    var StyleText = "";
    for (let i = 0; i < PropertyList.length; i++) {
        var New = PropertyList[i] + ": " + ValueList[i] + ";";
        StyleText += New;
    }
    document.getElementById(ForID).style.cssText += StyleText;
}


function ChangePage(changeto) {
    var CurrentUrl = window.location.toString();
    var LastSlace = CurrentUrl.lastIndexOf("/");
    var MainUrl = CurrentUrl.slice(0, LastSlace);
    var NewUrl = MainUrl + "/" + changeto + ".html";
    window.location.href = NewUrl;
}

var TopAppBar = document.getElementsByClassName("Top-App-Bar");
if (TopAppBar.length != 0) {
    var CurrentURL = window.location.href.toString();
    TopAppBar[0].parentElement.style.position = "sticky";
    TopAppBar[0].parentElement.style.top = "0";
    TopAppBar[0].parentElement.style.zIndex = "5";

    var TopAppBarTitle = document.getElementsByClassName('Top-App-Bar-Title')[0];
    TopAppBarTitle.innerHTML = document.title;

    var IconContainer = document.getElementsByClassName("Icon-Container");
    if (TopAppBar[0].parentElement.parentElement.id == 'start-here') {
        IconContainer[0].style.display = "none";
        TopAppBar[0].style.paddingLeft = "20px";
    }

    IconContainer[0].addEventListener('click', function () {
        history.back();
    });
}

var J = {};
var o = getComputedStyle(document.getElementById("c1"));
for (var i = 0; i < o.length; i++){
    var K = o[i];
    var V = o.getPropertyValue(o[i]);
    J[K] = V;
}
console.log(J['color']);
var C = J['color'];

console.log(window.location.href);

const clickable = document.getElementsByClassName("clickable");
if (clickable.length != 0) {
    for (let i = 0; i < clickable.length; i++) {
        clickable[i].onclick = function (event) {

            if (clickable[i].hasAttribute("action-type")) {
                if (clickable[i].getAttribute("action-type") == "alert dialog") {
                    var Title = clickable[i].getAttribute("alert-dialog-title");
                    var Description = clickable[i].getAttribute("alert-dialog-description");
                    var ButtonList = clickable[i].getAttribute("alert-dialog-button-list");
                    var ButtonArray = ButtonList.split(", ");
                    CreateAlert(Title, Description, ButtonArray);
                }

                if (clickable[i].getAttribute("action-type") == "state change") {
                    var ForID = clickable[i].getAttribute("for-id");
                    var Property = clickable[i].getAttribute("property-list");
                    var NewValue = clickable[i].getAttribute("value-list");

                    var PropertyArray = Property.split(", ");
                    var NewValueArray = NewValue.split(", ");

                    ChangeStyle(ForID, PropertyArray, NewValueArray);
                }

                if (clickable[i].getAttribute("action-type") == "change page") {
                    var ChangeTo = clickable[i].getAttribute("change-to");
                    ChangePage(ChangeTo);
                }
            }
            const button = event.currentTarget;
    
            const circle = document.createElement("span");
            const diameter = Math.max(button.clientWidth, button.clientHeight);
            const radius = diameter / 2;
    
            circle.style.width = circle.style.height = `${diameter}px`;
            circle.style.left = `${event.clientX - button.offsetLeft - radius}px`;
            circle.style.top = `${event.clientY - button.offsetTop - radius}px`;
            circle.classList.add("ripple");
    
            const ripple = button.getElementsByClassName("ripple")[0];
    
            if (ripple) {
                ripple.remove();
            }
    
            button.appendChild(circle);
        };
    }
}

const clickableText = document.getElementsByClassName("clickable-text");
if (clickableText.length != 0) {
    for (let i = 0; i < clickableText.length; i++) {
        clickableText[i].onclick = function (event) {

            if (clickableText[i].hasAttribute("action-type")) {
                if (clickableText[i].getAttribute("action-type") == "alert dialog") {
                    var Title = clickableText[i].getAttribute("alert-dialog-title");
                    var Description = clickableText[i].getAttribute("alert-dialog-description");
                    var ButtonList = clickableText[i].getAttribute("alert-dialog-button-list");
                    var ButtonArray = ButtonList.split(", ");
                    CreateAlert(Title, Description, ButtonArray);
                }

                if (clickableText[i].getAttribute("action-type") == "state change") {
                    var ForID = clickableText[i].getAttribute("for-id");
                    var Property = clickableText[i].getAttribute("property-list");
                    var NewValue = clickableText[i].getAttribute("value-list");

                    var PropertyArray = Property.split(", ");
                    var NewValueArray = NewValue.split(", ");

                    ChangeStyle(ForID, PropertyArray, NewValueArray);
                }

                if (clickableText[i].getAttribute("action-type") == "change page") {
                    var ChangeTo = clickableText[i].getAttribute("change-to");
                    ChangePage(ChangeTo);
                }
            }
            const button = event.currentTarget;
    
            const circle = document.createElement("span");
            const diameter = Math.max(button.clientWidth, button.clientHeight);
            const radius = diameter / 2;
    
            circle.style.width = circle.style.height = `${diameter}px`;
            circle.style.left = `${event.clientX - button.offsetLeft - radius}px`;
            circle.style.top = `${event.clientY - button.offsetTop - radius}px`;
            circle.classList.add("ripple");
    
            const ripple = button.getElementsByClassName("ripple")[0];
    
            if (ripple) {
                ripple.remove();
            }
    
            button.appendChild(circle);
        };
    }
}

const clickableOutlined = document.getElementsByClassName("clickable-outlined");
if (clickableOutlined.length != 0) {
    for (let i = 0; i < clickableOutlined.length; i++) {
        clickableOutlined[i].onclick = function (event) {

            if (clickableOutlined[i].hasAttribute("action-type")) {
                if (clickableOutlined[i].getAttribute("action-type") == "alert dialog") {
                    var Title = clickableOutlined[i].getAttribute("alert-dialog-title");
                    var Description = clickableOutlined[i].getAttribute("alert-dialog-description");
                    var ButtonList = clickableOutlined[i].getAttribute("alert-dialog-button-list");
                    var ButtonArray = ButtonList.split(", ");
                    CreateAlert(Title, Description, ButtonArray);
                }

                if (clickableOutlined[i].getAttribute("action-type") == "state change") {
                    var ForID = clickableOutlined[i].getAttribute("for-id");
                    var Property = clickableOutlined[i].getAttribute("property-list");
                    var NewValue = clickableOutlined[i].getAttribute("value-list");

                    var PropertyArray = Property.split(", ");
                    var NewValueArray = NewValue.split(", ");

                    ChangeStyle(ForID, PropertyArray, NewValueArray);
                }

                if (clickableOutlined[i].getAttribute("action-type") == "change page") {
                    var ChangeTo = clickableOutlined[i].getAttribute("change-to");
                    ChangePage(ChangeTo);
                }
            }
            const button = event.currentTarget;
    
            const circle = document.createElement("span");
            const diameter = Math.max(button.clientWidth, button.clientHeight);
            const radius = diameter / 2;
    
            circle.style.width = circle.style.height = `${diameter}px`;
            circle.style.left = `${event.clientX - button.offsetLeft - radius}px`;
            circle.style.top = `${event.clientY - button.offsetTop - radius}px`;
            circle.classList.add("ripple");
    
            const ripple = button.getElementsByClassName("ripple")[0];
    
            if (ripple) {
                ripple.remove();
            }
    
            button.appendChild(circle);
        };
    }
}

setInterval(() => {
    const clickableTextAlert = document.getElementsByClassName("Alert-clickable-text");
    if (clickableTextAlert.length != 0) {
        for (let i = 0; i < clickableTextAlert.length; i++) {
            clickableTextAlert[i].onclick = function (event) {
                const button = event.currentTarget;
        
                const circle = document.createElement("span");
                const diameter = Math.max(button.clientWidth, button.clientHeight);
                const radius = diameter / 2;
        
                circle.style.width = circle.style.height = `${diameter}px`;
                circle.style.left = `${event.clientX - button.offsetLeft - radius}px`;
                circle.style.top = `${event.clientY - button.offsetTop - radius}px`;
                circle.classList.add("ripple");
        
                const ripple = button.getElementsByClassName("ripple")[0];
        
                if (ripple) {
                    ripple.remove();
                }
        
                button.appendChild(circle);

                var AlertDialogContainer = clickableTextAlert[i].parentElement.parentElement.parentElement.parentElement;

                remove(AlertDialogContainer);
            };
        }
    }
}, 1);

async function remove(src) {
    await sleep(500);
    src.remove();
}