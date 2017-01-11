﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCActivity.ascx.cs" Inherits="Operations.UCActivity" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<link href="Styles/AjaxControlStyle.css" rel="stylesheet" type="text/css" />

<link href="Styles/HtmlTable.css" rel="stylesheet" type="text/css" />



<SCRIPT LANGUAGE="JavaScript">


    /*///////////The following is from   Sihui Wu <sihuiwsh (at) yahoo.com>////


    Dear Webmaster, 

    I discovered a bug in the javascript published on your
    website for 

    http://www.java2s.com/Code/JavaScript/GUI-Components/FancyTimePicker.htm

    the owner has written a very good script for free
    usage, however, the lines

    hideElement( 'SELECT',
    document.getElementById("calendar") );
    hideElement( 'APPLET',
    document.getElementById("calendar") );   

    should be changed to 

    hideElement( 'SELECT',
    document.getElementById("timepicker") );
    hideElement( 'APPLET',
    document.getElementById("timepicker") );  

    failure to do so leads to page error on internet
    explorer 6, when 2 or more timepicker were used on the
    same page. Most importantly, the function
    "hideElement" will fail, leading to incorrect display
    on internet explorer 6.


    Testing on internet explorer 7 managed to display the
    timepicker div correctly (above the select), but page
    error is still prompted.

    Thank you for sharing the javascript. Attached is the
    corrected script.

    Regards, 
    Wu Sihui

    */
    /////////////////////////////////Here is the fix from Sihui Wu 
    /////////////////////////////////Here is the fix from Sihui Wu 
    /////////////////////////////////Here is the fix from Sihui Wu 
    /////////////////////////////////Here is the fix from Sihui Wu 
    /*
    var imagePath='../images/';
  
    var ie=document.all;
    var dom=document.getElementById;
    var ns4=document.layers;
    var bShow=false;
    var textCtl;

    function setTimePicker(t) {
    textCtl.value=t;
    closeTimePicker();
    }

    function refreshTimePicker(mode) {
    
    if (mode==0)
    { 
    suffix="AM"; 
    }
    else
    { 
    suffix="PM"; 
    }

    sHTML = "<table><tr><td><table cellpadding=3 cellspacing=0 bgcolor='#f0f0f0'>";
    for (i=0;i<12;i++) {

    sHTML+="<tr align=right style='font-family:verdana;font-size:11px;color:#000000;'>";

    if (i==0) {
    hr = 12;
    }
    else {
    hr=i;
    }  

    for (j=0;j<4;j++) {
    sHTML+="<td width=57 style='cursor:hand;font-family:verdana;font-size:11px;' onmouseover='this.style.backgroundColor=\"#66CCFF\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+
    hr + ":" + padZero(j*15) + "&nbsp;" + suffix 
    + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero(j*15) + "&nbsp;" + suffix + 
    "\")'>" + hr + ":"+padZero(j*15) +"&nbsp;"+ "<font color=\"#808080\">" + suffix + "&nbsp;</font></a></td>";
    }

    sHTML+="</tr>";
    }
    sHTML += "</table></td></tr></table>";
    document.getElementById("timePickerContent").innerHTML = sHTML;
    }

    if (dom){
    document.write ("<div id='timepicker' style='z-index:9;position:absolute;visibility:hidden;'><table style='border-width:3px;border-style:solid;border-color:#0033AA' bgcolor='#ffffff' cellpadding=0><tr bgcolor='#0033AA'><td><table cellpadding=0 cellspacing=0 width='100%' background='" + imagePath + "titleback.gif'><tr valign=bottom height=21><td style='font-family:verdana;font-size:11px;color:#ffffff;padding:3px' valign=center><B>&nbsp;Select&nbsp;Time </B></td><td><img id='iconAM' src='" + imagePath + "am1.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am1.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm2.gif\";refreshTimePicker(0)' style='cursor:hand'></td><td><img id='iconPM' src='" + imagePath + "pm2.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am2.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm1.gif\";refreshTimePicker(1)' style='cursor:hand'></td><td align=right valign=center>&nbsp;<img onclick='closeTimePicker()' src='" + imagePath + "close.gif'  STYLE='cursor:hand'>&nbsp;</td></tr></table></td></tr><tr><td colspan=2><span id='timePickerContent'></span></td></tr></table></div>");
    refreshTimePicker(0);
    }

    var crossobj=(dom)?document.getElementById("timepicker").style : ie? document.all.timepicker : document.timepicker;
    var currentCtl

    function selectTime(ctl,ctl2) {
    var leftpos=0
    var toppos=0

    textCtl=ctl2;
    currentCtl = ctl
    currentCtl.src=imagePath + "timepicker2.gif";

    aTag = ctl
    do {
    aTag = aTag.offsetParent;
    leftpos  += aTag.offsetLeft;
    toppos += aTag.offsetTop;
    } while(aTag.tagName!="BODY");
    crossobj.left =  ctl.offsetLeft  + leftpos 
    crossobj.top = ctl.offsetTop +  toppos + ctl.offsetHeight +  2 
    crossobj.visibility=(dom||ie)? "visible" : "show"
    hideElement( 'SELECT', document.getElementById("timepicker") );
    hideElement( 'APPLET', document.getElementById("timepicker") );      
    bShow = true;
    }

    // hides <select> and <applet> objects (for IE only)
    function hideElement( elmID, overDiv ){
    if( ie ){
    for( i = 0; i < document.all.tags( elmID ).length; i++ ){
    obj = document.all.tags( elmID )[i];
    if( !obj || !obj.offsetParent ){
    continue;
    }
    // Find the element's offsetTop and offsetLeft relative to the BODY tag.
    objLeft   = obj.offsetLeft;
    objTop    = obj.offsetTop;
    objParent = obj.offsetParent;
    while( objParent.tagName.toUpperCase() != "BODY" )
    {
    objLeft  += objParent.offsetLeft;
    objTop   += objParent.offsetTop;
    objParent = objParent.offsetParent;
    }
    objHeight = obj.offsetHeight;
    objWidth = obj.offsetWidth;
    if(( overDiv.offsetLeft + overDiv.offsetWidth ) <= objLeft );
    else if(( overDiv.offsetTop + overDiv.offsetHeight ) <= objTop );
    else if( overDiv.offsetTop >= ( objTop + objHeight + obj.height ));
    else if( overDiv.offsetLeft >= ( objLeft + objWidth ));
    else
    {
    obj.style.visibility = "hidden";
    }
    }
    }
    }
     
    //unhides <select> and <applet> objects (for IE only)
    function showElement( elmID ){
    if( ie ){
    for( i = 0; i < document.all.tags( elmID ).length; i++ ){
    obj = document.all.tags( elmID )[i];
    if( !obj || !obj.offsetParent ){
    continue;
    }
    obj.style.visibility = "";
    }
    }
    }

    function closeTimePicker() {
    crossobj.visibility="hidden"
    showElement( 'SELECT' );
    showElement( 'APPLET' );
    currentCtl.src=imagePath + "timepicker.gif"
    }

    document.onkeypress = function hideTimePicker1 () { 
    if (event.keyCode==27){
    if (!bShow){
    closeTimePicker();
    }
    }
    }

    function isDigit(c) {
    
    return ((c=='0')||(c=='1')||(c=='2')||(c=='3')||(c=='4')||(c=='5')||(c=='6')||(c=='7')||(c=='8')||(c=='9'))
    }

    function isNumeric(n) {
    
    num = parseInt(n,10);

    return !isNaN(num);
    }

    function padZero(n) {
    v="";
    if (n<10){ 
    return ('0'+n);
    }
    else
    {
    return n;
    }
    }

    function validateDatePicker(ctl) {

    t=ctl.value.toLowerCase();
    t=t.replace(" ","");
    t=t.replace(".",":");
    t=t.replace("-","");

    if ((isNumeric(t))&&(t.length==4))
    {
    t=t.charAt(0)+t.charAt(1)+":"+t.charAt(2)+t.charAt(3);
    }

    var t=new String(t);
    tl=t.length;

    if (tl==1 ) {
    if (isDigit(t)) {
    ctl.value=t+":00 am";
    }
    else {
    return false;
    }
    }
    else if (tl==2) {
    if (isNumeric(t)) {
    if (parseInt(t,10)<13){
    if (t.charAt(1)!=":") {
    ctl.value= t + ':00 am';
    } 
    else {
    ctl.value= t + '00 am';
    }
    }
    else if (parseInt(t,10)==24) {
    ctl.value= "0:00 am";
    }
    else if (parseInt(t,10)<24) {
    if (t.charAt(1)!=":") {
    ctl.value= (t-12) + ':00 pm';
    } 
    else {
    ctl.value= (t-12) + '00 pm';
    }
    }
    else if (parseInt(t,10)<=60) {
    ctl.value= '0:'+padZero(t)+' am';
    }
    else {
    ctl.value= '1:'+padZero(t%60)+' am';
    }
    }
    else
    {
    if ((t.charAt(0)==":")&&(isDigit(t.charAt(1)))) {
    ctl.value = "0:" + padZero(parseInt(t.charAt(1),10)) + " am";
    }
    else {
    return false;
    }
    }
    }
    else if (tl>=3) {

    var arr = t.split(":");
    if (t.indexOf(":") > 0)
    {
    hr=parseInt(arr[0],10);
    mn=parseInt(arr[1],10);

    if (t.indexOf("pm")>0) {
    mode="pm";
    }
    else {
    mode="am";
    }

    if (isNaN(hr)) {
    hr=0;
    } else {
    if (hr>24) {
    return false;
    }
    else if (hr==24) {
    mode="am";
    hr=0;
    }
    else if (hr>12) {
    mode="pm";
    hr-=12;
    }
    }
      
    if (isNaN(mn)) {
    mn=0;
    }
    else {
    if (mn>60) {
    mn=mn%60;
    hr+=1;
    }
    }
    } else {

    hr=parseInt(arr[0],10);

    if (isNaN(hr)) {
    hr=0;
    } else {
    if (hr>24) {
    return false;
    }
    else if (hr==24) {
    mode="am";
    hr=0;
    }
    else if (hr>12) {
    mode="pm";
    hr-=12;
    }
    }

    mn = 0;
    }
      
    if (hr==24) {
    hr=0;
    mode="am";
    }
    ctl.value=hr+":"+padZero(mn)+" "+mode;
    }
    }
    */
    /////////////////// Here is the original which is from Tan Ling wee
    /////////////////// Here is the original which is from Tan Ling wee
    /////////////////// Here is the original which is from Tan Ling wee
    /////////////////// Here is the original which is from Tan Ling wee
    ///////////////////  Here is the original which is from Tan Ling wee



    //  Written by Tan Ling wee
    //  on 19 June 2005
    //  email :  info@sparrowscripts.com
    //    url : www.sparrowscripts.com

    var imagePath = 'timePickerImages/';

    var ie = document.all;
    var dom = document.getElementById;
    var ns4 = document.layers;
    var bShow = false;
    var textCtl;

    function setTimePicker(t) {
        textCtl.value = t;
        closeTimePicker();
    }

    function refreshTimePicker(mode) {

        if (mode == 0) {
            suffix = "am";
        }
        else {
            suffix = "pm";
        }

        sHTML = "<table><tr><td><table cellpadding=3 cellspacing=0 bgcolor='#f0f0f0'>";
        for (i = 0; i <= 11; i++) {

            sHTML += "<tr align=right style='font-family:verdana;font-size:9px;color:#000000;'>";

            if (i == 0) {
                hr = 12;
            }
            else {
                hr = i;
            }

            for (j = 0; j < 4; j++) {
                sHTML += "<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#66CCFF\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\"" + hr + ":" + padZero(j * 15) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\"" + hr + ":" + padZero(j * 15) + " " + suffix + "\")'>" + hr + ":" + padZero(j * 15) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
            }

            sHTML += "</tr>";
        }
        sHTML += "</table></td></tr></table>";
        document.getElementById("timePickerContent").innerHTML = sHTML;
    }

    if (dom) {
        document.write("<div id='timepicker' style='z-index:+999;position:absolute;visibility:hidden;'><table style='border-width:3px;border-style:solid;border-color:#0033AA' bgcolor='#ffffff' cellpadding=0><tr bgcolor='#0033AA'><td><table cellpadding=0 cellspacing=0 width='100%' background='" + imagePath + "titleback.gif'><tr valign=bottom height=21><td style='font-family:verdana;font-size:11px;color:#ffffff;padding:3px' valign=center><B>&nbsp;&nbsp;Select a Time&nbsp;&nbsp;</B></td><td><img id='iconAM' src='" + imagePath + "am1.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am1.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm2.gif\";refreshTimePicker(0)' style='cursor:hand'></td><td><img id='iconPM' src='" + imagePath + "pm2.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am2.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm1.gif\";refreshTimePicker(1)' style='cursor:hand'></td><td align=right valign=center>&nbsp;<img onclick='closeTimePicker()' src='" + imagePath + "close.gif'  STYLE='cursor:hand'>&nbsp;</td></tr></table></td></tr><tr><td colspan=2><span id='timePickerContent'></span></td></tr></table></div>");
        refreshTimePicker(0);
    }

    var crossobj = (dom) ? document.getElementById("timepicker").style : ie ? document.all.timepicker : document.timepicker;
    var currentCtl

    function selectTime(ctl, ctl2) {
        var leftpos = 0
        var toppos = 0

        textCtl = ctl2;
        currentCtl = ctl
        currentCtl.src = imagePath + "timepicker2.gif";

        aTag = ctl
        do {
            aTag = aTag.offsetParent;
            leftpos += aTag.offsetLeft;
            toppos += aTag.offsetTop;
        } while (aTag.tagName != "BODY");
        crossobj.left = ctl.offsetLeft + leftpos
        crossobj.top = ctl.offsetTop + toppos + ctl.offsetHeight + 2
        crossobj.visibility = (dom || ie) ? "visible" : "show"
        hideElement('SELECT', document.getElementById("calendar"));
        hideElement('APPLET', document.getElementById("calendar"));
        bShow = true;
    }

    // hides <select> and <applet> objects (for IE only)
    function hideElement(elmID, overDiv) {
        if (ie) {
            for (i = 0; i < document.all.tags(elmID).length; i++) {
                obj = document.all.tags(elmID)[i];
                if (!obj || !obj.offsetParent) {
                    continue;
                }
                // Find the element's offsetTop and offsetLeft relative to the BODY tag.
                objLeft = obj.offsetLeft;
                objTop = obj.offsetTop;
                objParent = obj.offsetParent;
                while (objParent.tagName.toUpperCase() != "BODY") {
                    objLeft += objParent.offsetLeft;
                    objTop += objParent.offsetTop;
                    objParent = objParent.offsetParent;
                }
                objHeight = obj.offsetHeight;
                objWidth = obj.offsetWidth;
                if ((overDiv.offsetLeft + overDiv.offsetWidth) <= objLeft);
                else if ((overDiv.offsetTop + overDiv.offsetHeight) <= objTop);
                else if (overDiv.offsetTop >= (objTop + objHeight + obj.height));
                else if (overDiv.offsetLeft >= (objLeft + objWidth));
                else {
                    obj.style.visibility = "hidden";
                }
            }
        }
    }

    //unhides <select> and <applet> objects (for IE only)
    function showElement(elmID) {
        if (ie) {
            for (i = 0; i < document.all.tags(elmID).length; i++) {
                obj = document.all.tags(elmID)[i];
                if (!obj || !obj.offsetParent) {
                    continue;
                }
                obj.style.visibility = "";
            }
        }
    }

    function closeTimePicker() {
        crossobj.visibility = "hidden"
        showElement('SELECT');
        showElement('APPLET');
        currentCtl.src = imagePath + "timepicker.gif"
    }

    document.onkeypress = function hideTimePicker1() {
        if (event.keyCode == 27) {
            if (!bShow) {
                closeTimePicker();
            }
        }
    }

    function isDigit(c) {

        return ((c == '0') || (c == '1') || (c == '2') || (c == '3') || (c == '4') || (c == '5') || (c == '6') || (c == '7') || (c == '8') || (c == '9'))
    }

    function isNumeric(n) {

        num = parseInt(n, 10);

        return !isNaN(num);
    }

    function padZero(n) {
        v = "";
        if (n < 10) {
            return ('0' + n);
        }
        else {
            return n;
        }
    }

    function validateDatePicker(ctl) {

        t = ctl.value.toLowerCase();
        t = t.replace(" ", "");
        t = t.replace(".", ":");
        t = t.replace("-", "");

        if ((isNumeric(t)) && (t.length == 4)) {
            t = t.charAt(0) + t.charAt(1) + ":" + t.charAt(2) + t.charAt(3);
        }

        var t = new String(t);
        tl = t.length;

        if (tl == 1) {
            if (isDigit(t)) {
                ctl.value = t + ":00 am";
            }
            else {
                return false;
            }
        }
        else if (tl == 2) {
            if (isNumeric(t)) {
                if (parseInt(t, 10) < 13) {
                    if (t.charAt(1) != ":") {
                        ctl.value = t + ':00 am';
                    }
                    else {
                        ctl.value = t + '00 am';
                    }
                }
                else if (parseInt(t, 10) == 24) {
                    ctl.value = "0:00 am";
                }
                else if (parseInt(t, 10) < 24) {
                    if (t.charAt(1) != ":") {
                        ctl.value = (t - 12) + ':00 pm';
                    }
                    else {
                        ctl.value = (t - 12) + '00 pm';
                    }
                }
                else if (parseInt(t, 10) <= 60) {
                    ctl.value = '0:' + padZero(t) + ' am';
                }
                else {
                    ctl.value = '1:' + padZero(t % 60) + ' am';
                }
            }
            else {
                if ((t.charAt(0) == ":") && (isDigit(t.charAt(1)))) {
                    ctl.value = "0:" + padZero(parseInt(t.charAt(1), 10)) + " am";
                }
                else {
                    return false;
                }
            }
        }
        else if (tl >= 3) {

            var arr = t.split(":");
            if (t.indexOf(":") > 0) {
                hr = parseInt(arr[0], 10);
                mn = parseInt(arr[1], 10);

                if (t.indexOf("pm") > 0) {
                    mode = "pm";
                }
                else {
                    mode = "am";
                }

                if (isNaN(hr)) {
                    hr = 0;
                } else {
                    if (hr > 24) {
                        return false;
                    }
                    else if (hr == 24) {
                        mode = "am";
                        hr = 0;
                    }
                    else if (hr > 12) {
                        mode = "pm";
                        hr -= 12;
                    }
                }

                if (isNaN(mn)) {
                    mn = 0;
                }
                else {
                    if (mn > 60) {
                        mn = mn % 60;
                        hr += 1;
                    }
                }
            } else {

                hr = parseInt(arr[0], 10);

                if (isNaN(hr)) {
                    hr = 0;
                } else {
                    if (hr > 24) {
                        return false;
                    }
                    else if (hr == 24) {
                        mode = "am";
                        hr = 0;
                    }
                    else if (hr > 12) {
                        mode = "pm";
                        hr -= 12;
                    }
                }

                mn = 0;
            }

            if (hr == 24) {
                hr = 0;
                mode = "am";
            }
            ctl.value = hr + ":" + padZero(mn) + " " + mode;
        }
    }

</SCRIPT>





<table align="center" cellspacing="1"  class="TableWidth">
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
        <center> <b style="font-size: large">POP Activity Log</b></center>
        </td>
        <td>
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SSRSActivity.aspx" 
        Font-Underline="True" ForeColor="Blue">ActivityReports</asp:HyperLink></td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
    <%--        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>--%>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td >
            </td>
        <td >
            <b>Purpose of Visit</b></td>
        <td >
            <asp:DropDownList ID="ddlvisit" runat="server" Width="175px" 
                AutoPostBack="True" onselectedindexchanged="ddlvisit_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="ddlvisit" Display="Dynamic" 
                ErrorMessage="Please Select Purpose of Visit" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td >
            </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Provider</b></td>
        <td>
            <asp:DropDownList ID="ddlprovider" runat="server" Width="175px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>POP</b></td>
        <td>
            <asp:DropDownList ID="ddlpop" runat="server" Width="175px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Date</b></td>
        <td>
            <asp:TextBox ID="txtdate" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvdate" runat="server" 
                ControlToValidate="txtdate" Display="Dynamic" ErrorMessage="Enter Date" 
                ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CalendarExtender ID="CEFromDate" TargetControlID="txtdate" Format="dd/MM/yyyy" runat="server">
                  </asp:CalendarExtender>


        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Modified By</b></td>
        <td>
            <asp:TextBox ID="txtmodifiedby" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvModifiedBy" runat="server" 
                ControlToValidate="txtmodifiedby" Display="Dynamic" 
                ErrorMessage="Enter Modified By User Name" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <strong>Work Order/Ticket Number</strong></td>
        <td>
            <asp:TextBox ID="txtWorkOrderNumber" runat="server" Width="175px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Location</b></td>
        <td>
            <asp:TextBox ID="txtlocation" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" 
                ControlToValidate="txtlocation" Display="Dynamic" 
                ErrorMessage="Enter Location Details" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Comments</b></td>
        <td>
            <asp:TextBox ID="txtcomments" runat="server" TextMode="MultiLine" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtcomments" Display="Dynamic" 
                ErrorMessage="Please Enter Comments" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Voltage</b></td>
        <td>
            <asp:TextBox ID="txtvoltage" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvVoltage" runat="server" 
                ControlToValidate="txtvoltage" Display="Dynamic" ErrorMessage="Enter Voltage" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
     <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Battery Load</b></td>
        <td>
            <asp:TextBox ID="txtbatteryload" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBatteryLoad" runat="server" 
                ControlToValidate="txtbatteryload" Display="Dynamic" 
                ErrorMessage="Enter Battery Load" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Hot/COLD Rectifier</b></td>
        <td>
            <asp:TextBox ID="txtrectifier" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRectifier" runat="server" 
                ControlToValidate="txtrectifier" Display="Dynamic" 
                ErrorMessage="Enter Hot / Field Rectifier" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Agent/Field Engineer name</b></td>
        <td>
            <asp:TextBox ID="txtengineer" runat="server" Width="175px"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="rfvAgetntFieldEngineerName" runat="server" 
                ControlToValidate="txtengineer" Display="Dynamic" 
                ErrorMessage="Enter Agent / Field Engineer Name" ForeColor="Red"></asp:RequiredFieldValidator>
            
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Login time</b></td>
        <td>
            <asp:TextBox ID="txtlogintime" runat="server" autocomplete="off" Width="175px"></asp:TextBox>

            <asp:Panel ID="PFromTime"  runat="server" CssClass="popupControl" >
            
          
             
             <asp:UpdatePanel runat="server" ID="UPTimePicker">
             <ContentTemplate>
              <asp:RadioButtonList ID="RadioButtonTimeFrom" runat="server" OnSelectedIndexChanged="RadioButtonTimeFrom_SelectedIndexChanged" AutoPostBack="true" RepeatColumns="6" RepeatDirection ="Horizontal" >
                <asp:ListItem Text="0:00"></asp:ListItem>
                <asp:ListItem Text="0:30"></asp:ListItem>
                <asp:ListItem Text="1:00"></asp:ListItem>
                <asp:ListItem Text="1:30"></asp:ListItem>
                <asp:ListItem Text="2:00"></asp:ListItem>
                <asp:ListItem Text="2:30"></asp:ListItem>
                <asp:ListItem Text="3:00"></asp:ListItem>
                <asp:ListItem Text="3:30"></asp:ListItem>
                <asp:ListItem Text="4:00"></asp:ListItem>
                <asp:ListItem Text="4:30"></asp:ListItem>
                <asp:ListItem Text="5:00"></asp:ListItem>
                <asp:ListItem Text="5:30"></asp:ListItem>
                <asp:ListItem Text="6:00"></asp:ListItem>
                <asp:ListItem Text="6:30"></asp:ListItem>
                <asp:ListItem Text="7:00"></asp:ListItem>
                <asp:ListItem Text="7:30"></asp:ListItem>
                <asp:ListItem Text="8:00"></asp:ListItem>
                <asp:ListItem Text="8:30"></asp:ListItem>
                <asp:ListItem Text="9:00"></asp:ListItem>
                <asp:ListItem Text="9:30"></asp:ListItem>
                <asp:ListItem Text="10:00"></asp:ListItem>
                <asp:ListItem Text="10:30"></asp:ListItem>
                <asp:ListItem Text="11:00"></asp:ListItem>
                <asp:ListItem Text="11:30"></asp:ListItem>
                <asp:ListItem Text="12:00"></asp:ListItem>
                <asp:ListItem Text="12:30"></asp:ListItem>
                <asp:ListItem Text="13:00"></asp:ListItem>
                <asp:ListItem Text="13:30"></asp:ListItem>
                <asp:ListItem Text="14:00"></asp:ListItem>
                <asp:ListItem Text="14:30"></asp:ListItem>
                <asp:ListItem Text="15:00"></asp:ListItem>
                <asp:ListItem Text="15:30"></asp:ListItem>
                <asp:ListItem Text="16:00"></asp:ListItem>
                <asp:ListItem Text="16:30"></asp:ListItem>
                <asp:ListItem Text="17:00"></asp:ListItem>
                <asp:ListItem Text="17:30"></asp:ListItem>
                <asp:ListItem Text="18:00"></asp:ListItem>
                <asp:ListItem Text="18:30"></asp:ListItem>
                <asp:ListItem Text="19:00"></asp:ListItem>
                <asp:ListItem Text="19:30"></asp:ListItem>
                <asp:ListItem Text="20:00"></asp:ListItem>
                <asp:ListItem Text="20:30"></asp:ListItem>
                <asp:ListItem Text="21:00"></asp:ListItem>
                <asp:ListItem Text="21:30"></asp:ListItem>
                <asp:ListItem Text="22:00"></asp:ListItem>
                <asp:ListItem Text="22:30"></asp:ListItem>
                <asp:ListItem Text="23:00"></asp:ListItem>
                <asp:ListItem Text="23:30"></asp:ListItem>
                <asp:ListItem Text="23:59"></asp:ListItem>
              
                </asp:RadioButtonList>
             

               

             </ContentTemplate>
             </asp:UpdatePanel>
            
            
            
            </asp:Panel>

            <asp:PopupControlExtender ID="PopupControlExtender2" runat="server" 
            TargetControlID="txtlogintime"
            PopupControlID="PFromTime"
            CommitProperty="value"
            Position="Bottom"
            />

            <asp:RequiredFieldValidator ID="rfvLoginTime" runat="server" 
                ControlToValidate="txtlogintime" Display="Dynamic" 
                ErrorMessage="Enter Login Time" ForeColor="Red"></asp:RequiredFieldValidator>
            
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>Logout time</b></td>
        <td>
            <asp:TextBox ID="txtlogouttime" runat="server" Width="175px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLogoutTime" runat="server" 
                ControlToValidate="txtlogouttime" Display="Dynamic" 
                ErrorMessage="Enter Logout Time" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            
          <asp:Panel ID="Plogouttime" runat="server" CssClass="popupControl" >
             
             <asp:UpdatePanel runat="server" ID="UPtxtlogouttime">
             <ContentTemplate>
              <asp:RadioButtonList ID="RadioButtontxtlogouttime" runat="server" 
                     OnSelectedIndexChanged="RadioButtontxtlogouttime_SelectedIndexChanged" 
                     AutoPostBack="true" RepeatColumns="6" RepeatDirection ="Horizontal" >
                <asp:ListItem Text="0:00"></asp:ListItem>
                <asp:ListItem Text="0:30"></asp:ListItem>
                <asp:ListItem Text="1:00"></asp:ListItem>
                <asp:ListItem Text="1:30"></asp:ListItem>
                <asp:ListItem Text="2:00"></asp:ListItem>
                <asp:ListItem Text="2:30"></asp:ListItem>
                <asp:ListItem Text="3:00"></asp:ListItem>
                <asp:ListItem Text="3:30"></asp:ListItem>
                <asp:ListItem Text="4:00"></asp:ListItem>
                <asp:ListItem Text="4:30"></asp:ListItem>
                <asp:ListItem Text="5:00"></asp:ListItem>
                <asp:ListItem Text="5:30"></asp:ListItem>
                <asp:ListItem Text="6:00"></asp:ListItem>
                <asp:ListItem Text="6:30"></asp:ListItem>
                <asp:ListItem Text="7:00"></asp:ListItem>
                <asp:ListItem Text="7:30"></asp:ListItem>
                <asp:ListItem Text="8:00"></asp:ListItem>
                <asp:ListItem Text="8:30"></asp:ListItem>
                <asp:ListItem Text="9:00"></asp:ListItem>
                <asp:ListItem Text="9:30"></asp:ListItem>
                <asp:ListItem Text="10:00"></asp:ListItem>
                <asp:ListItem Text="10:30"></asp:ListItem>
                <asp:ListItem Text="11:00"></asp:ListItem>
                <asp:ListItem Text="11:30"></asp:ListItem>
                <asp:ListItem Text="12:00"></asp:ListItem>
                <asp:ListItem Text="12:30"></asp:ListItem>
                <asp:ListItem Text="13:00"></asp:ListItem>
                <asp:ListItem Text="13:30"></asp:ListItem>
                <asp:ListItem Text="14:00"></asp:ListItem>
                <asp:ListItem Text="14:30"></asp:ListItem>
                <asp:ListItem Text="15:00"></asp:ListItem>
                <asp:ListItem Text="15:30"></asp:ListItem>
                <asp:ListItem Text="16:00"></asp:ListItem>
                <asp:ListItem Text="16:30"></asp:ListItem>
                <asp:ListItem Text="17:00"></asp:ListItem>
                <asp:ListItem Text="17:30"></asp:ListItem>
                <asp:ListItem Text="18:00"></asp:ListItem>
                <asp:ListItem Text="18:30"></asp:ListItem>
                <asp:ListItem Text="19:00"></asp:ListItem>
                <asp:ListItem Text="19:30"></asp:ListItem>
                <asp:ListItem Text="20:00"></asp:ListItem>
                <asp:ListItem Text="20:30"></asp:ListItem>
                <asp:ListItem Text="21:00"></asp:ListItem>
                <asp:ListItem Text="21:30"></asp:ListItem>
                <asp:ListItem Text="22:00"></asp:ListItem>
                <asp:ListItem Text="22:30"></asp:ListItem>
                <asp:ListItem Text="23:00"></asp:ListItem>
                <asp:ListItem Text="23:30"></asp:ListItem>
                <asp:ListItem Text="23:59"></asp:ListItem>
              
                </asp:RadioButtonList>
             

               

             </ContentTemplate>
             </asp:UpdatePanel>
            
            </asp:Panel>

            <asp:PopupControlExtender ID="PopupControlExtenderLogoutTime" runat="server" 
            TargetControlID="txtlogouttime"
            PopupControlID="Plogouttime"
            CommitProperty="value"
            Position="Bottom"
            />
            
        </td>
        <td>
            &nbsp;</td>
    </tr>
   
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            
            </td>
        <td>
            &nbsp;</td>
    </tr>
   
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary configure" 
                Text="Submit" onclick="btnsubmit_Click" />
        &nbsp;
            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary configure" 
                Text="Cancel" onclick="btnCancel_Click" ValidationGroup="Cancel" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td >
            </td>
        <td  colspan="2">
        <center>
            <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblsuccessmsg" runat="server" ForeColor="#009933"></asp:Label>
            </center>
            </td>
        <td class="style2">
            </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>

 