
//Added By : Himanshu Pandya
//Date : 01-11-2012
function ValidatePageControl(StrValidationGroup) { Page_ClientValidate(StrValidationGroup); }
function ValidateCustomer(StrValidationGroup) {
    var arrInvalidControls = new Array();
    if (Page_Validators.length > 0) {
        for (i = 0; i < Page_Validators.length; i++) {
            var Check = true;
            var Validator = Page_Validators[i];
            if ((Validator.validationGroup != null) && (Validator.validationGroup == StrValidationGroup)) {
                for (j = 0; j < arrInvalidControls.length; j++) {
                    if (Validator.controltovalidate == arrInvalidControls[j]) {
                        Check = false;
                    }
                }

                if (Check) {
                    objControl = document.getElementById(Validator.controltovalidate);
                    if (objControl != null) {

                        if (Validator.isvalid) {
                            objControl.style.border = "1px inset #C5C5C6";
                            objControl.style.background = "#FFFFFF";
                            objControl.title = "";
                            Check = true;
                        }
                        else {
                            objControl.style.border = "1px solid red";
                            objControl.style.background = "#FFCDCD";
                            objControl.title = Validator.errormessage;
                            arrInvalidControls.push(Validator.controltovalidate);
                            check = false;
                        }
                    }
                }
            }
        }
    }
}

//Added By : Himanshu Pandya
//Date : 01-12-2012
// Customer Script Starts Here
$(document).ready(function () {
    //syntax highlighter
    hljs.tabReplace = '    ';
    hljs.initHighlightingOnLoad();
    //collapsible management
    $('.collapsible').collapsible({
        defaultOpen: 'section1',
        cookieName: 'nav'
    });
    $('.page_collapsible').collapsible({
        defaultOpen: 'body-section1',
        cookieName: 'body'
    });

    //assign open/close all to functions
    function openAll() {
        $('.page_collapsible').collapsible('open');
    }
    function closeAll() {
        $('.page_collapsible').collapsible('close');
    }

    //listen for close/open all
    $('#closeAll').click(function (event) {
        event.preventDefault();
        closeAll();

    });
    $('#openAll').click(function (event) {
        event.preventDefault();
        openAll();
    });


    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
});


function EndRequestHandler() {
    //syntax highlighter
    hljs.tabReplace = '    ';
    hljs.initHighlightingOnLoad();
    //collapsible management
    $('.collapsible').collapsible({
        defaultOpen: 'section1',
        cookieName: 'nav'
    });
    $('.page_collapsible').collapsible({
        defaultOpen: 'body-section1',
        cookieName: 'body'
    });

    //assign open/close all to functions
    function openAll() {
        $('.page_collapsible').collapsible('open');
    }
    function closeAll() {
        $('.page_collapsible').collapsible('close');
    }

    //listen for close/open all
    $('#closeAll').click(function (event) {
        event.preventDefault();
        closeAll();

    });
    $('#openAll').click(function (event) {
        event.preventDefault();
        openAll();
    });

    $('#btnNewCustomer').click(function (event) {
        openAll();
    });

    $('#ibtnEditCustomer').click(function (event) {
        openAll();
    });

}

//Added By : Himanshu Pandya
//Date : 02-12-2012
function CheckDateOfBrith(objdate, minAge) {
    try {
        var today = new Date();
        var elem = objdate.value.split('/');
        var birthDate = new Date(elem[1] + "/" + elem[0] + "/" + elem[2]);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }

        if (age < minAge) {
            //alert("Date of birth can not be less than 18 years");
            alert("Date of birth can not be less than 18 years");
            objdate.value = '';
            return false;
        }
    }
    catch (ex) {
        //alert("Eror : " + ex);
    }
}
//Cusomer Script Ends Here

//Added By : Himanshu Pandya
//Date : 10-12-2012
function NumericsOnly(objControl, evt) {
    try {
        evt = (evt) ? evt : event;
        var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
           ((evt.which) ? evt.which : 0));
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            objControl.style.border = "1px solid red";
            objControl.style.background = "#FFCDCD";
            objControl.title = "Enter numerics only in this field";
            return false;
        }
        else {
            objControl.style.border = "1px inset #C5C5C6";
            objControl.style.background = "#FFFFFF";
            objControl.title = "";
        }
    } catch (ex) {
        alert(ex);
    }
    return true;
}

// Modified  By : Himanshu Pandya
// Date : 29-12-2012
// JQuery Callpsible Ends Here //
function CheckGridSingleSelection(objSender, gridId, hdnCustId, custId, gridindex) {
    var objhdnCustId = document.getElementById(hdnCustId);
    var objGrid = document.getElementById(gridId);
    var arrSelect = objGrid.getElementsByTagName("input");
    if (arrSelect.length > 0) {
        for (index = 0; index < arrSelect.length; index++) {
            if (arrSelect[index].id == 'chkSelect' && index != gridindex) {
                arrSelect[index].checked = false;
            }
        }

        if (objSender.checked) {
            objhdnCustId.value = custId;
        }
        else {
            objhdnCustId.value = "";
        }
    }
    return true;
}
 
