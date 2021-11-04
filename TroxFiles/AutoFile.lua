local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Rio(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevRio:del(Trox.."Rio:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Rio(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevRio:set(Trox.."Rio:Lock:AutoFile",true) 
end 
end

if (text and not DevRio:get(Trox.."Rio:Lock:AutoFile")) then
Time = DevRio:get(Trox.."Rio:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevRio:smembers(Trox..'Rio:Groups') 
local BotName = (DevRio:get(Trox.."Rio:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..Trox..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevRio:get(Trox.."Rio:Groups:Links"..v)
Welcomes = DevRio:get(Trox..'Rio:Groups:Welcomes'..v) or ''
RioConstructors = DevRio:smembers(Trox..'Rio:RioConstructor:'..v)
BasicConstructors = DevRio:smembers(Trox..'Rio:BasicConstructor:'..v)
Constructors = DevRio:smembers(Trox..'Rio:Constructor:'..v)
Managers = DevRio:smembers(Trox..'Rio:Managers:'..v)
Admis = DevRio:smembers(Trox..'Rio:Admins:'..v)
Vips = DevRio:smembers(Trox..'Rio:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #RioConstructors ~= 0 then
GetJson = GetJson..'"RioConstructors":['
for k,v in pairs(RioConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Trox..'.json', "w")
File:write(GetJson)
File:close()
local Rio = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Rio .. '" -F "chat_id='..DevId..'" -F "document=@'..Trox..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..Trox..'.json')
DevRio:set(Trox.."Rio:AutoFile:Time",os.date("%x"))
end
else 
DevRio:set(Trox.."Rio:AutoFile:Time",os.date("%x"))
end
end

end
return {
Trox = AutoFile
}