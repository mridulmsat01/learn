*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library     DataDriver  robot/SFSC_TestAutomation/testdata/Test.xlsx  sheet_name=MSL Chinese Confused Flow
Resource    Source.robot

Test Template  Verify MSL Chinese Confused flow

*** Test Cases ***
Verify MSL Chinese Confused flow  ${TestID}  ${TestName}  ${User_Input1}  ${Bot_Output1}  ${User_Input2}  ${Bot_Output2}
  ...  ${User_Input3}  ${Bot_Output3}  ${User_Input4}  ${Bot_Output4}  ${User_Input5}  ${Bot_Output5}
  ...  ${User_Input6}  ${Bot_Output6}  ${User_Input7}  ${Bot_Output7}  ${User_Input8}  ${Bot_Output8}
  ...  ${User_Input9}  ${Bot_Output9}  ${User_Input10}  ${Bot_Output10}  ${User_Input11}  ${Bot_Output11}
  ...  ${User_Input12}  ${Bot_Output12}  ${User_Input13}  ${Bot_Output13}  ${User_Input14}  ${Bot_Output14}
  ...  ${User_Input15}  ${Bot_Output15}  ${User_Input16}  ${Bot_Output16}  ${User_Input17}  ${Bot_Output17}
  ...  ${UpdateShipmentNumber}  ${VerifyChatUser}


*** Keywords ***
Verify MSL Chinese Confused flow
       [Arguments]  ${TestName}  ${User_Input1}  ${Bot_Output1}  ${User_Input2}  ${Bot_Output2}
  ...  ${User_Input3}  ${Bot_Output3}  ${User_Input4}  ${Bot_Output4}  ${User_Input5}  ${Bot_Output5}
  ...  ${User_Input6}  ${Bot_Output6}  ${User_Input7}  ${Bot_Output7}  ${User_Input8}  ${Bot_Output8}
  ...  ${User_Input9}  ${Bot_Output9}  ${User_Input10}  ${Bot_Output10}  ${User_Input11}  ${Bot_Output11}
  ...  ${User_Input12}  ${Bot_Output12}  ${User_Input13}  ${Bot_Output13}  ${User_Input14}  ${Bot_Output14}
  ...  ${User_Input15}  ${Bot_Output15}  ${User_Input16}  ${Bot_Output16}  ${User_Input17}  ${Bot_Output17}
  ...  ${UpdateShipmentNumber}  ${TestID}  ${VerifyChatUser}

# Precondition for Test
  ${List}  Create List  ${TestName}  ${User_Input1}  ${Bot_Output1}  ${User_Input2}  ${Bot_Output2}
  ...   ${User_Input3}  ${Bot_Output3}  ${User_Input4}  ${Bot_Output4}  ${User_Input5}  ${Bot_Output5}
  ...   ${User_Input6}  ${Bot_Output6}  ${User_Input7}  ${Bot_Output7}  ${User_Input8}  ${Bot_Output8}
  ...   ${User_Input9}  ${Bot_Output9}  ${User_Input10}  ${Bot_Output10}  ${User_Input11}  ${Bot_Output11}
  ...   ${User_Input12}  ${Bot_Output12}  ${User_Input13}  ${Bot_Output13}  ${User_Input14}  ${Bot_Output14}
  ...   ${User_Input15}  ${Bot_Output15}  ${User_Input16}  ${Bot_Output16}  ${User_Input17}  ${Bot_Output17}
  ...   ${UpdateShipmentNumber}  ${TestID}  ${VerifyChatUser}
  UpdateShipmentNumber  ${List}  ${UpdateShipmentNumber}
  UpdateExpectedLink  ${List}  ${UpdateShipmentNumber}
  ${UserInput1} =  GetListValue   ${List}  1
  ${BotOutput1} =  GetListValue   ${List}  2
  ${UserInput2} =  GetListValue   ${List}  3
  ${BotOutput2} =  GetListValue   ${List}  4
  ${UserInput3} =  GetListValue   ${List}  5
  ${BotOutput3} =  GetListValue   ${List}  6
  ${UserInput4} =  GetListValue   ${List}  7
  ${BotOutput4} =  GetListValue   ${List}  8
  ${UserInput5} =  GetListValue   ${List}  9
  ${BotOutput5} =  GetListValue   ${List}  10
  ${UserInput6} =  GetListValue   ${List}  11
  ${BotOutput6} =  GetListValue   ${List}  12
  ${UserInput7} =  GetListValue   ${List}  13
  ${BotOutput7} =  GetListValue   ${List}  14
  ${UserInput8} =  GetListValue   ${List}  15
  ${BotOutput8} =  GetListValue   ${List}  16
  ${UserInput9} =  GetListValue   ${List}  17
  ${BotOutput9} =  GetListValue   ${List}  18
  ${UserInput10} =  GetListValue   ${List}  19
  ${BotOutput10} =  GetListValue   ${List}  20
  ${UserInput11} =  GetListValue   ${List}  21
  ${BotOutput11} =  GetListValue   ${List}  22
  ${UserInput12} =  GetListValue   ${List}  23
  ${BotOutput12} =  GetListValue   ${List}  24
  ${UserInput13} =  GetListValue   ${List}  25
  ${BotOutput13} =  GetListValue   ${List}  26
  ${UserInput14} =  GetListValue   ${List}  27
  ${BotOutput14} =  GetListValue   ${List}  28
  ${UserInput15} =  GetListValue   ${List}  29
  ${BotOutput15} =  GetListValue   ${List}  30
  ${UserInput16} =  GetListValue   ${List}  31
  ${BotOutput16} =  GetListValue   ${List}  32
  ${UserInput17} =  GetListValue   ${List}  33
  ${BotOutput17} =  GetListValue   ${List}  34

#Start Test for ChatBot Happy flow
  Start TestCase  ${TestID}  ${TestName}
  CallKeyword  Open PreprodMSLPortal
  CallKeyword  Click AllowAll
  CallKeyword  Login ChineseMSLPreProd
  CallKeyword  Reload Page
  Click ChatSnapinAndVerifyUser  ${VerifyChatUser}
  Input ChatText  ${UserInput1}
  VerifyBotOutput  ${BotOutput1}
  Input ChatText  ${UserInput2}
  VerifyBotOutput  ${BotOutput2}
  Input ChatText  ${UserInput3}
  VerifyBotOutput  ${BotOutput3}
  Input ChatText  ${UserInput4}
  VerifyBotOutput  ${BotOutput4}
  Input ChatText  ${UserInput5}
  VerifyBotOutput  ${BotOutput5}
  Input ChatText  ${UserInput6}
  VerifyBotOutput  ${BotOutput6}
  Input ChatText  ${UserInput7}
  VerifyBotOutput  ${BotOutput7}
  Input ChatText  ${UserInput8}
  VerifyBotOutput  ${BotOutput8}
  Input ChatText  ${UserInput9}
  VerifyBotOutput  ${BotOutput9}
  Input ChatText  ${UserInput10}
  VerifyBotOutput  ${BotOutput10}
  Input ChatText  ${UserInput11}
  VerifyBotOutput  ${BotOutput11}
  Input ChatText  ${UserInput12}
  VerifyBotOutput  ${BotOutput12}
  Input ChatText  ${UserInput13}
  VerifyBotOutput  ${BotOutput13}
  Input ChatText  ${UserInput14}
  VerifyBotOutput  ${BotOutput14}
  Input ChatText  ${UserInput15}
  VerifyBotOutput  ${BotOutput15}
  Input ChatText  ${UserInput16}
  VerifyBotOutput  ${BotOutput16}
  Input ChatText  ${UserInput17}
  VerifyBotOutput  ${BotOutput17}
  End TestCase   ${TestID}  ${TestName}

