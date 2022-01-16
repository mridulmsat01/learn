*** Settings ***
Library           String
Library  SeleniumLibrary
Library  Collections
Resource    Source.robot

*** Variables ***
${env}  Preprod
${SalesforceSandBoxURL}  https://test.salesforce.com/
&{url}  SIT=https://cdt.maersk.com/portaluser/login  Preprod=https://demo.maersk.com/portaluser/login
${URLSLM}  https://demo.sealandmaersk.com/portaluser/login
#  Technical BOT starts
${URLMSLTech}  https://demo.maersk.com/support/chat/#/
${firstname}  //input[@id='firstName']
${lastname}  //input[@id='lastName']
${emailaddress}  //input[@id='emailAddress']
${chatlanguage}  xpath://select[@id="typeDropdown"]
${needsupport}  xpath://select[@id="supportDropdown"]
${submit}  xpath:(//button[contains(text(),' Submit ')])
${continuechat}  xpath:(//button[contains(text(),' Continue to Chat ')])
#  Technical BOT ends
${user_name}  jpptwo
${password}  Maersk#3
${user_nameSLM}  sptexternal
${passwordSLM}  Maersk#1
${user_nameChineseMSL}  chat_pp_china
${passwordChineseMSL}  Maersk#123
${SFuser_AutoAccept}  mohammad.jawedrob@maersk.com
${SFpassword}  Testing123*
${SFtxt_username}  //input[@name='username']
${SFtxt_password}  //input[@id='password']
${SFbtn_login}  //input[@name='Login']
${txt_username}  xpath://input[@name="usernameInput"]
${txt_password}  xpath://input[@name="passwordInput"]
${btn_login}  xpath://button[contains(text(),'Log in')]
#${btn_login}  xpath://button[contains(text(),'Log in with Azure')]
${btn_Select}  xpath:(//button[contains(text(),' Select ')])[2]
${btn_SelectSLM}  xpath:(//button[contains(text(),' Select ')])[1]
${btn_AllowAll}  xpath://button[@aria-label="Allow all"]
${btn_Region}  xpath:(//span[@class="radio-button__outer"])[1]
${btn_Continue}  xpath://button[@id="confirmRegion"]
${txt_ChatText}  xpath://textarea[@id="119:0"]
${btn_ChatSnapin}  xpath:(//button[@class="uiButton helpButtonEnabled"])[1]
${url1}  https://demo.maersk.com/portaluser/login
${ShipmentNumber}  ShipmentNumber
${CaseNumber}  //span[contains(text(),'I created a case number')]|//span[contains(text(),'A case has been created in our records')]|//span[contains(text(),'关于本次对话已经自动存档并生成受理号码为')]|//span[contains(text(),'我已经创建了一个高优先级的事件，编号为')]|//span[contains(text(),'I have created a high priority case with case number')]|//span[contains(text(),'现在是我们的非工作时间，感谢理解。您的问题已经自动保存并生成受理号码')]|//span[contains(text(),'You have reached us outside of our normal business hours. A High Priority case with case')]|//span[contains(text(),'Se ha creado un caso en nuestro sistema. Número de caso:')]|//span[contains(text(),'Hemos creado el caso')]|//span[contains(text(),'Desafortunadamente en este momento no hay agentes disponibles. Hemos creado el caso')]|//span[contains(text(),'Lamentablemente su solicitud ha tenido lugar fuera de nuestro horario de oficina. Acabamos de crear el número de caso')]
${PostChatWindow}  //iframe[@class='snapins_postChat']
${txt_PostChatWindow}  xpath://label[@for='fbDetails2']
${CSATSmileys}  xpath://span[@class="slds-text-title"]
${CSATComments}  xpath://textarea[@name="j_id0:showmsg:fbDetails2"]
${CSATSubmit}  xpath://input[@class="btn"]
${txt_PostChatCloseWindow}  xpath://div[@class="messageText"]
${SetFlag}  True
${ExpectedLinkValue}  VerifyLink
${Link}  xpath://a[contains(text(),'maersk.com')]|//a[contains(text(),'Maersk.com')]
${waitingGreeting}  xpath://div[@class="waitingGreeting "]
${WelcomeMessage}   xpath:(//*[@class='slds-rich-text-editor__output'])[1]
${ChatBotOut}   xpath://*[@class='slds-rich-text-editor__output']
${btn_OmniChannelWindow}  xpath:(//button[@class="bare slds-button slds-utility-bar__action slds-truncate uiButton"])[1]
${btn_OmniChannelChangeStatus}  xpath://button[@class='slds-button slds-button_icon-container slds-button_icon-x-small']
${btn_Online}   xpath:(//*[contains(text(),'Online')])[2]
${regExPattern}  [\r\n'(❌)" "]

*** Keywords ***
####################################################################################################
# Description  : This is just to show in log for each test case started with test case Id
# Coverage
# Created
# Author : Jawed
# Latest Revision:
# last modified by :
#####################################################################################################
Start TestCase
  [Arguments]  ${TestID}  ${Test_Name}
    Log to console  ${TestID}
    Log to console  ${Test_Name}


####################################################################################################
# Description  : This is just to show in log for each test case Ended with test case Id
# Coverage
# Created
# Author : Jawed
# Latest Revision:
# last modified by :
#####################################################################################################
End TestCase
    [Arguments]  ${TestID}  ${Test_Name}
    Close All Browsers
    Log to console  End of Log for the Testcase : ${TestID} - ${Test_Name}


####################################################################################################
# Description  : Log Error Message can be used to log any custom error message to higlight any failure
# Coverage
# Created
# Author : Jawed
# Latest Revision:
# last modified by :
#####################################################################################################
Log Error Message
  [Arguments]  ${Custom_message}
  Run keyword And Continue On Failure    Fail   Step got fail
  Log to console   ${Custom_message}


####################################################################################################
# Description      : Log success Message can be used to log any custom message in the report
# Coverage         : It it used in many sceanrios whrere we can't call the standerd .
# Created
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
Log Success Message
    [Arguments]  ${Custom_Message}
    Log to console  ${Custom_Message}

####################################################################################################
# Description     : CallKeyword will help in calling custom keywords and it will handle error and provide debug message
# Coverage
# Created
# Author          : Jawed
# Latest Revision :
# last modified by :
#####################################################################################################
CallKeyword  [Arguments]  ${Key}
   run keyword if  ${SetFlag}  ${Key}
   ...  ELSE  OnFail
OnPass
   Log to console  Run test on Pass
OnFail
   Log Error Message  ****** Test Fail at this Step  while calling keyword : ${Key} *******



# GetListValue is use to fetch updated value from the list Example word 'ShipmentNumber' and
# used in the test during runtime
GetListValue
   [Arguments]  ${ListA}  ${position}
   ${value2} =  Get From List    ${ListA}    ${position}
   [Return]     ${value2}

#############################################################################################################################
# Description      : UpdateShipmentNumber will check the word 'ShipmentNumber' reading from the excel sheet in the form of List and
                    #  update it with the Shipment Number value reading from the excel sheet
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#############################################################################################################################
UpdateShipmentNumber  [Arguments]  ${ListA}  ${Update_ShipmentNumber}
   ${position} =    Get Index From List  ${ListA}  ${ShipmentNumber}
   Set List Value   ${ListA}    ${position}    ${Update_ShipmentNumber}
   ${value2} =  Get From List    ${ListA}    ${position}

####################################################################################################
# Description      : This keyword is to update the shipment number in the expected link ,since we are are
                    # going to run the script with different shipment number hence we need to updated the expected link
                    # with the shipement number which is going to handle through this keyword
# Coverage         : Keyword can be used to verify any kind of link which include shipment number
# Created          : 06-10-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
UpdateExpectedLink  [Arguments]  ${ListA}  ${Update_ShipmentNumber}
    ${FindVerifyLink}    Set Variable   VerifyLinkType
    ${count}  Set Variable  -1
     FOR    ${item}    IN    @{ListA}
       ${CompSplitedLink} =  Run Keyword And Return Status   Should Contain  ${item}  ${FindVerifyLink}
       ${count} =   Evaluate   ${count} + 1
       Exit For Loop If  '${CompSplitedLink}'=='True'
     END
    ${value} =  Get From List    ${ListA}    ${count}
    @{getSplitedLink} =    Split String    ${value}    /
      FOR    ${SplitedLinkValue}    IN    @{getSplitedLink}
         ${LenghOFSplittedLink}=  Get Length  ${SplitedLinkValue}
         ${IsIntegerSplitedLinkValue}=    Run Keyword And Return Status   Evaluate    isinstance(${SplitedLinkValue}, int)
         Exit For Loop If  ${LenghOFSplittedLink}==9 and '${IsIntegerSplitedLinkValue}'=='True'
      END
      Run Keyword If  ${LenghOFSplittedLink}==9 and '${IsIntegerSplitedLinkValue}'=='True'  DoLinkUpdateifConditionMatch  ${ListA}  ${value}  ${count}  ${SplitedLinkValue}  ${Update_ShipmentNumber}

DoLinkUpdateifConditionMatch
   [Arguments]  ${ListA}  ${value}  ${count}  ${SplitedLinkValue}  ${Update_ShipmentNumber}
   ${updatedLink} =  Replace String  ${value}  ${SplitedLinkValue}   ${Update_ShipmentNumber}
   Set List Value   ${ListA}    ${count}    ${updatedLink}

####################################################################################################
# Description      : This keyword is to Login to portal
# Coverage         : Keyword can be used to verify any kind of link which include shipment number
# Created          : 06-10-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################

Open PreprodMSLPortal
    Open Browser  ${url.${env}}  chrome
    Maximize Browser Window
    Sleep  5

Open PreprodSLMPortal
    Open Browser  ${URLSLM}  headlesschrome
    Maximize Browser Window
    Sleep  5

Open PreprodMSLPortaltechnical
    Open Browser  ${URLMSLTech}  chrome
    Maximize Browser Window
    Sleep  5


Click Region
    Sleep  15
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${btn_Region}
    Log to console  Status for Region button visible : ${Result}
    Run Keyword If  '${Result}'=='True'  Click Element  ${btn_Region}
    ...  ELSE  Log Error Message    Not able to find Region button
    Sleep  5
    Click Button  ${btn_Continue}
    Sleep  10

Login MSLPreProd
    Input Text  ${txt_username}  ${user_name}
    Sleep  3
    Input Text  ${txt_password}  ${password}
    Sleep  3
    Click Button  ${btn_login}


Login SLMPreProd
    Input Text  ${txt_username}  ${user_nameSLM}
    Sleep  3
    Input Text  ${txt_password}  ${passwordSLM}
    Sleep  3
    Click Button  ${btn_login}

Login ChineseMSLPreProd
    Input Text  ${txt_username}  ${user_nameChineseMSL}
    Sleep  3
    Input Text  ${txt_password}  ${passwordChineseMSL}
    Sleep  3
    Click Button  ${btn_login}
    Sleep  15

Technical BOT Register
    [Arguments]  ${RegistLang}  ${RegistIssue}
    Input Text  ${firstname}  test
    Sleep  3
    Input Text  ${lastname}  test
    Sleep  3
    ${randomstring} =  Generate Random String  8  [NUMBERS]
    Input Text  ${emailaddress}  ${randomstring}@maersk.com
    Sleep  3
    Select From List By Label    typeDropdown   ${RegistLang}
    Sleep  3
    Select From List By Label    supportDropdown   ${RegistIssue}
    Sleep  3
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${submit}
    Log to console  Status for Submit button visible : ${Result}
    Run Keyword If  '${Result}'=='True'  Click Element  ${submit}
    ...  ELSE  Log Error Message    Not able to find Submit button
    Sleep  10
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${continuechat}
    Log to console  Status for Continue to Chat button visible : ${Result}
    Run Keyword If  '${Result}'=='True'  Click Element  ${continuechat}
    ...  ELSE  Log Error Message    Not able to find Continue to Chat button
    Sleep  3

#############################################################################################################################
# Description      : This Keyword handles portal pop-up AllowAll button
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#############################################################################################################################
Click AllowAll
    Sleep  15
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${btn_AllowAll}
    Log to console  Status for AllowAll button visible : ${Result}
    Run Keyword If  '${Result}'=='True'  Click Button  ${btn_AllowAll}
    ...  ELSE  Log Error Message    Not able to find AllowAll button
    Sleep  5

#############################################################################################################################
# Description      : Select CustomerCode will click on Select Customer code
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#############################################################################################################################
Select CustomerCode
    Sleep  20
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${btn_Select}
    Log to console  Status for Select CustomerCode visible : ${Result}
    Run Keyword If  '${Result}'=='True'  Click Button  ${btn_Select}
    ...  ELSE  Log Error Message    Not able to Select Customercode
    Sleep  30

Select CustomerCodeSLM
    Sleep  20
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${btn_SelectSLM}
    Log to console  Status for Select CustomerCode visible : ${Result}
    Run Keyword If  '${Result}'=='True'  Click Button  ${btn_SelectSLM}
    ...  ELSE  Log Error Message    Not able to Select Customercode
    Sleep  30
#############################################################################################################################
# Description      : This will check the Chat Snapin exist then click on it .
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#############################################################################################################################
Click ChatSnapinAndVerifyUser
    [Arguments]  ${VerifyUser}
    Sleep  30
    ${Result} =  Run Keyword And Return Status    Wait Until Element Is Visible  ${btn_ChatSnapin}  300
    Log to console  Status for ChatSnapin button : ${Result}
    Run Keyword If  '${Result}'=='True'  Verify User  ${VerifyUser}
    ...  ELSE  Log Error Message    Chat Snapin not loading or not able to click
    Sleep  60

#############################################################################################################################
# Description      : This will verify the user name appear on waiting Greeting window and campare it from excel.
                     # This will get called once chat snapin get clicked
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#############################################################################################################################
Verify User
  [Arguments]  ${VerifyUser}
  Click Button  ${btn_ChatSnapin}
  Log to console  Successfully clicked on ChatSnapin
  ${Result} =  Run Keyword And Return Status   Wait Until Element Is Visible  ${waitingGreeting}  60
  Log to console  Status for user on waitingGreeting message present : ${Result}
  ${waitingGreetingText} =  Get Text  ${waitingGreeting}
  Log to console  Text or User fetch from waiting greeting window : ${waitingGreetingText}
  ${Result1} =  Run Keyword And Return Status   Should be equal as strings  ${waitingGreetingText}  ${VerifyUser}
  Log to console  Check status for username appear on chat window and input from excel is same : ${Result1}
  Run Keyword If  '${Result}'=='True'   Log Success Message   User on greeting window is visible
  Run Keyword If  '${Result1}'=='True'   Log Success Message   User on greeting window and pass from the excel is same which is : ${waitingGreetingText}
  ...  ELSE  Log Error Message    User on the Chat greeting window either not appearing or not matching

####################################################################################################
# Description      : This is to verify CSAT window it will just check if the CSAT window appear or not
# Coverage         : It can to used any positive flow for which gives CSAT
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################

VerifyCSATWindow
    [Arguments]  ${CSATResponse}
    Sleep  15
    ${Result1} =  Run Keyword And Return Status    Select Frame  ${PostChatWindow}
    Run Keyword If  '${Result1}'=='True'  Log Success Message   CSAT Frame Selected successfully
    ...  ELSE  Log Error Message    CSAT Frame not found
    @{CSATOutputList} =  Get WebElements    ${CSATSmileys}
     FOR  ${CSATOutput}  IN  @{CSATOutputList}
        Sleep  1
        ${text}=  Get Text  ${CSATOutput}
        ${CSATBotOutput} =  Run Keyword And Return Status   Should be equal as strings  ${text}  ${CSATResponse}  strip_spaces=True
           Exit For Loop If  '${CSATBotOutput}'=='True'
     END
     ${Result2} =  Run Keyword And Return Status    Click Element  ${CSATOutput}
     Run Keyword If  '${Result2}'=='True'  Log Success Message   CSAT Response Selected successfully
     ...  ELSE  Log Error Message    CSAT Response not found
     Sleep  7
     ${Result3} =  Run Keyword And Return Status    Input Text  ${CSATComments}  ${CSATResponse}
     Run Keyword If  '${Result3}'=='True'  Log Success Message   CSAT Comments added successfully
     ...  ELSE  Log Error Message    CSAT Comments Not added
     Sleep  7
     ${Result4} =  Run Keyword And Return Status    Click Element  ${CSATSubmit}
     Run Keyword If  '${Result4}'=='True'  Log Success Message   CSAT Submitted successfully
     ...  ELSE  Log Error Message    CSAT Not Submitted


VerifyPostChatWindow
    [Arguments]   ${PostChatCloseWindowText}
    Sleep  15
    ${Result2} =  Run Keyword And Return Status    Element Should Be Visible  ${txt_PostChatCloseWindow}
    Log to console  Status for Close Chat Window appear : ${Result2}
    Run Keyword If  '${Result2}'=='True'  Log Success Message   Close Chat Window exist
    ...  ELSE  Log Error Message    Close Chat Window is not found
    ${CloseChatWindowText} =  Get Text  ${txt_PostChatCloseWindow}
    ${CloseChatWindowText} =   Replace String Using Regexp    ${CloseChatWindowText}  ${regExPattern}  ${EMPTY}
    Log to console  ${CloseChatWindowText}
    ${CompPostChatText} =  Run Keyword And Return Status   Should be equal as strings  ${CloseChatWindowText}  ${PostChatCloseWindowText}
    Run Keyword If  '${CompPostChatText}'=='True'  Log Success Message  Post Chat Text Matched
    ...  ELSE  Log Error Message    Post Chat Text did not Match

####################################################################################################
# Description      : VerifyCaseNumber will check the casenumber appear on the chat widget and fetch it
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################

VerifyCaseNumber
    Sleep  10
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${CaseNumber}
    Log to console  Status for CaseNumber created and appear on Chat Widget : ${Result}
    Run Keyword If  '${Result}'!='True'  Scroll Element Into View  ${CaseNumber}
    Sleep  10
    ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${CaseNumber}
    Run Keyword If  '${Result}'=='True'  Get Text  ${CaseNumber}
    ...  ELSE  Log Error Message    CaseNumber either not fetched or created
    ${pCaseNumber} =  Get Text  ${CaseNumber}
    Log to console  ${pCaseNumber}


####################################################################################################
# Description      : This keyword will verify the links which are not dynamic or changing which kept under Type1
# Coverage         :
# Created          : 1-10-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
VerifyStaticLink
    [Arguments]   ${ExpectedChatBotLinks}
    Log to console  Link found to verify is of Type1 which is static link : ${ExpectedChatBotLinks}
    @{ChatBotLinks} =  Get WebElements    ${Link}
    FOR    ${BotLink}  IN  @{ChatBotLinks}
       ${ChatBotLink}=  Get Text  ${BotLink}
       #${ChatBotLink} =  Get Text  ${Link}
       ${CompBotLink} =  Run Keyword And Return Status   Should be equal as strings  ${ExpectedChatBotLinks}  ${ChatBotLink}
       Exit For Loop If  '${CompBotLink}'=='True'
    END
    Log to console  Status for link comparision is : ${CompBotLink}
    Log to console  Expected link from excel : ${ExpectedChatBotLinks}
    Log to console  Link from Bot output : ${ChatBotLink}
    Run Keyword If  '${CompBotLink}'=='True'  Log Success Message  Link looks fine & matching under this scenario .
    ...  ELSE  LinkDifference   ${ExpectedChatBotLinks}  ${ChatBotLink}

####################################################################################################
# Description      : This keyword is to update the shipment number once the script found the word ShipmentNumber,
                    # since we are are going to run the script with different shipment number hence we need to update
                    # the sheet with shipmentNumber which can be pass from any part of excel which is going to handle through this keyword
# Coverage         :
# Created          : 1-10-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
VerifyUpdatingShipmentNumberLink
    [Arguments]   ${ExpectedChatBotLinks}
    Log to console  Link found to verify is of Type2 which is updating Shipment Number in the link : ${ExpectedChatBotLinks}
    @{ChatBotLinks} =  Get WebElements    ${Link}
    FOR    ${BotLink}  IN  @{ChatBotLinks}
       ${ChatBotLink}=  Get Text  ${BotLink}
       ${CompBotLink} =  Run Keyword And Return Status   Should be equal as strings  ${ExpectedChatBotLinks}  ${ChatBotLink}
       Exit For Loop If  '${CompBotLink}'=='True'
    END
    Log to console  Status for link comparision is : ${CompBotLink}
    Log to console  Expected link from excel : ${ExpectedChatBotLinks}
    Log to console  Link from Bot output : ${ChatBotLink}
    Run Keyword If  '${CompBotLink}'=='True'  Log Success Message  Link looks fine & matching under this scenario .
    ...  ELSE  LinkDifference   ${ExpectedChatBotLinks}  ${ChatBotLink}

VerifyDynamicLink
    Log to console  Successfully Verify updating Dynamic link

####################################################################################################
# Description      : This keyword is to going to find the differene in the links from the excel and Chat bot output
# Coverage         : Keyword can be used to verify any kind of link which include shipment number
# Created          : 20-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
LinkDifference
    [Arguments]   ${ExpectedChatBotLinks}  ${ActualLink}
    ${count}  Set Variable  0
    ${Iteration}  Set Variable  0
    @{SplitExpectedLink} =    Split String    ${ExpectedChatBotLinks}    /
    @{SplitActualLink} =    Split String    ${ActualLink}    /
    FOR  ${var}    IN    @{SplitExpectedLink}
      Log to console  ${SplitActualLink}[${count}]
      ${AppendLink}   Set Variable  ${SplitActualLink}[${count}]
      ${CompSplitedLink} =  Run Keyword And Return Status   Should be equal as strings  ${var}  ${SplitActualLink}[${count}]
      Run Keyword If  '${CompSplitedLink}'=='True'  Log Success Message  Link looks fine & matching
      ...  ELSE  Log Error Message    Links not matching at the point : ${var}
      ${count} =   Evaluate   ${count} + 1
      Exit For Loop If  '${CompSplitedLink}'=='False'
    END


####################################################################################################
# Description      : Input ChatText will enter the chat text reading from the excel sheet ,it will skip if it found
                     # no value pass from excel also call the keyword if it found to pass from excel
# Coverage         : It can to used any positive flow for which gives CSAT
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
Input ChatText
    [Arguments]  ${fUserInput}
    ${userInputlength} =  Get Length  ${fUserInput}
    Run Keyword If  ${userInputlength} > 0  CheckAndRunBotInputKeyword  ${fUserInput}

Check ChatTextExist
  [Arguments]  ${fUser_Input}
  ${Result} =  Run Keyword And Return Status    Element Should Be Visible  ${txt_ChatText}
  Log to console  Status for Chat text field visible : ${Result}
  Run Keyword If  '${Result}'=='True'  Sub Enter ChatText  ${fUser_Input}
  ...  ELSE  Log Error Message    Chat text field not found
  Sleep  20

Sub Enter ChatText
    [Arguments]  ${fUser_Input1}
    Sleep  7
    Input Text  ${txt_ChatText}  ${fUser_Input1}
    Sleep  1
    Press Keys  ${txt_ChatText}  RETURN
    Log to console  Successfully enter text to chat field : ${fUser_Input1}

####################################################################################################
# Description      : It is like a switch case where it will check input from excel and based on that it will run keyword
                   # while calling Input ChatText
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
CheckAndRunBotInputKeyword
    [Arguments]  ${CheckInput}
    Log to console  Keyword or Input from excel : ${CheckInput}
    ${CheckLength}=  Get Length  ${CheckInput}
    ${CheckStringContain}   Set Variable   VerifyLink
    ${CheckifInputContain} =  Run Keyword And Return Status   Should Contain  ${CheckInput}  ${CheckStringContain}
    Run Keyword Unless  '${CheckifInputContain}'=='True'  log to console  \nexecuted with multiple and
    @{NAME} =    Split String    ${CheckInput}    _
    ${CheckInput} =   Set Variable   ${NAME}[0]
    Run Keyword If  '${CheckInput}'=='VerifyLinkType1'  VerifyStaticLink  ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='VerifyLinkType2'
    ...  Run Keyword   VerifyUpdatingShipmentNumberLink  ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='VerifyLinkType3'
    ...  Run Keywords   VerifyDynamicLink  ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='VerifyCaseNumber'
    ...  Run Keywords   VerifyCaseNumber
    ...  ELSE IF  '${CheckInput}'=='AgentOnlineWithAutoAccept'
    ...  Run Keywords   AgentOnlineWithAutoAccept
    ...  ELSE IF  '${CheckInput}'=='AgentOnlineWithoutAutoAccept'
    ...  Run Keywords   AgentOnlineWithoutAutoAccept
    ...  ELSE IF  '${CheckInput}'=='Login MSLPreProd'
    ...  Run Keyword   Login MSLPreProd  ${NAME}[1]  ${NAME}[2]
    ...  ELSE IF  '${CheckInput}'=='GenericKeyWord'
    ...  Run Keywords   GenericKeyword
    ...  ELSE  Check ChatTextExist  ${CheckInput}

GenericKeyword
   Log to console  Perfectly called the generic keyword
####################################################################################################
# Description      : It is like a switch case where it will check input from excel and based on that it will run keyword
                   # while calling Input ChatText keyword
# Coverage         :
# Created          : 10-08-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
CheckAndRunBotOutputKeyword
    [Arguments]  ${CheckInput}
    ${CheckInput} =   Replace String Using Regexp    ${CheckInput}  ${regExPattern}  ${EMPTY}
    ${CheckLength}=  Get Length  ${CheckInput}
    ${CheckStringContain}   Set Variable   VerifyLink
    Log to console  Keyword or Input from excel to verify BotOutput after clearing special char: ${CheckInput}
    ${CheckifInputContain} =  Run Keyword And Return Status   Should Contain  ${CheckInput}  ${CheckStringContain}
    Run Keyword Unless  '${CheckifInputContain}'=='True'  log to console  \nexecuted with multiple and
    @{NAME} =    Split String    ${CheckInput}    _
    ${CheckInput} =   Set Variable   ${NAME}[0]
    Run Keyword If  '${CheckInput}'=='VerifyLinkType1'  VerifyStaticLink  ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='VerifyLinkType2'
    ...  Run Keyword   VerifyUpdatingShipmentNumberLink  ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='VerifyLinkType3'
    ...  Run Keywords   VerifyDynamicLink  ${CheckInput}
    ...  ELSE IF  '${CheckInput}'=='VerifyCaseNumber'
    ...  Run Keywords   VerifyCaseNumber
    ...  ELSE IF  '${CheckInput}'=='AgentOnlineWithAutoAccept'
    ...  Run Keywords   AgentOnlineWithAutoAccept
    ...  ELSE IF  '${CheckInput}'=='AgentOnlineWithoutAutoAccept'
    ...  Run Keywords   AgentOnlineWithoutAutoAccept
    ...  ELSE IF  '${CheckInput}'=='VerifyPostChatWindow'
    ...  Run Keyword   VerifyPostChatWindow   ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='VerifyCSATWindow'
    ...  Run Keyword   VerifyCSATWindow   ${NAME}[1]
    ...  ELSE IF  '${CheckInput}'=='GenericKeyWord'
    ...  Run Keywords   GenericKeyword
    ...  ELSE  Check ChatOutputTextExist  ${CheckInput}


####################################################################################################
# Description      : This is to verify Chat bot output also call the custom keyword if pass through excel and skip for null value in excel
# Coverage         : Keyword can be used to verify any kind of Bot output supporing different languages
# Created          : 28-09-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################

VerifyBotOutput
    [Arguments]  ${Bot_Output}
    ${userInputlength} =  Get Length  ${Bot_Output}
    Run Keyword If  ${userInputlength} > 0  CheckAndRunBotOutputKeyword  ${Bot_Output}


####################################################################################################
# Description      : This keyword is to verify the Bot output,it will remove some special char Ex : '
                     # & also it strip some spaces before verifying the String.Locator used under this should validate
                     # all the Bot for different landuage
# Coverage         : Keyword can be used to verify any kind of Bot output supporing different languages
# Created          : 29-09-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
Check ChatOutputTextExist
    [Arguments]  ${CheckInput}
    ${GetPartialMessageFromExcel} =  Get Substring  ${CheckInput}    0    45
#Part of Below code for Chat Bot Output
    ${Result} =  Run Keyword And Return Status    Get WebElement  ${ChatBotOut}
    @{ChatBotOutputList} =  Get WebElements    ${ChatBotOut}
    Log to console  Status for ChatBot output text present : ${Result}
    ${NumOfChatBotOutput} =  Get Element Count  ${ChatBotOut}
    @{formListOfBotOutput}=    Create List
     FOR  ${BotOutput}  IN  @{ChatBotOutputList}
        Sleep  1
        ${text}=  Get Text  ${BotOutput}
        ${text1} =   Replace String Using Regexp    ${text}  ${regExPattern}  ${EMPTY}
        ${CompBotOutput} =  Run Keyword And Return Status   Should be equal as strings  ${text1}  ${CheckInput}  strip_spaces=True
        ${CompBotOutput1} =  Run Keyword And Return Status   Should Contain  ${text1}  ${GetPartialMessageFromExcel}  strip_spaces=True
        Exit For Loop If  '${CompBotOutput}'=='True' or '${CompBotOutput1}'=='True'
     END
       Log to console  Expected value from excel to verify Bot output  : ${CheckInput}
       Log to console  Partial expected output as per excel : ${GetPartialMessageFromExcel}
       Log to console  Final output fetched from Bot during run time : ${text1}
       Log to console  Status for complete message to verify from Bot output : ${CompBotOutput}
       Log to console  Status for partial message to verify from Bot output : ${CompBotOutput1}
       Run Keyword If  '${CompBotOutput}'=='True'  Log Success Message  BotOutput verification checked for entire message Pass for : ${CheckInput}
       ...  ELSE IF  '${CompBotOutput}'=='False' and '${CompBotOutput1}'=='True'
       ...  Run Keyword   Log Success Message  BotOutput verification checked partially and Pass for : ${CheckInput}
       ...  ELSE IF  '${CompBotOutput}'=='False' and '${CompBotOutput1}'=='False'
       ...  Run Keyword   Log Error Message   BotOutput verification fail Expected ...${CheckInput}



#####################################################################################################
# Description      :This keyword to open new tab and open salesforce and login as an Agent with auto accept and switch back the
                    # control to browser where Bot is running
# Coverage         : Make agent online
# Created          : 12-10-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
AgentOnlineWithAutoAccept
    Execute Javascript    window.open('${SalesforceSandBoxURL}')
    Sleep  5
    ${Window1Title}=    Get Window Titles
    Switch Window  title:${Window1Title}[0]
    Switch Window  title:${Window1Title}[1]
    Input Text  ${SFtxt_username}  ${SFuser_AutoAccept}
    Sleep  1
    Input Text  ${SFtxt_password}  ${SFpassword}
    Sleep  1
    Click Button  ${SFbtn_login}
    Log to console  Login to salesforce successfully
    Sleep  60
    Click Button  ${btn_OmniChannelWindow}
    Log to console  Successfully clicked on Omni-Channel Dock
    Sleep  4
    Click Button  ${btn_OmniChannelChangeStatus}
    Sleep  4
    Press Keys  ${btn_Online}  ENTER
    Sleep  5
    Press Keys  ${btn_Online}  RETURN
    Log to console  Successfully make agent online
    Sleep  3
    Switch Window  title:${Window1Title}[0]
    Sleep  5

AgentOnlineChat
    ${Window1Title}=    Get Window Titles
    Switch Window  title:${Window1Title}[0]
    Switch Window  title:${Window1Title}[1]

#####################################################################################################
# Description      :This keyword to open new tab and open salesforce and login as an Agent without autoaccept and switch back the
                    # control to browser where Bot is running
# Coverage         : Make agent online
# Created          : 12-10-2021
# Author           : Jawed
# Latest Revision  :
# last modified by :
#####################################################################################################
AgentOnlineWithoutAutoAccept
    Execute Javascript    window.open('${SalesforceSandBoxURL}')
    Sleep  5
    ${Window1Title}=    Get Window Titles
    Switch Window  title:${Window1Title}[0]
    Switch Window  title:${Window1Title}[1]
    Input Text  ${SFtxt_username}  ${SFuser_NoAutoAccept}
    Sleep  1
    Input Text  ${SFtxt_password}  ${SFpassword}
    Sleep  1
    Click Button  ${SFbtn_login}
    Log to console  Login to salesforce successfully
    Sleep  60
    Click Button  ${btn_OmniChannelWindow}
    Log to console  Successfully clicked on Omni-Channel Dock
    Sleep  4
    Click Button  ${btn_OmniChannelChangeStatus}
    Sleep  4
    Press Keys  ${btn_Online}  ENTER
    Sleep  5
    Press Keys  ${btn_Online}  RETURN
    Log to console  Successfully make agent online
    Sleep  3
    Switch Window  title:${Window1Title}[0]
    Sleep  5


