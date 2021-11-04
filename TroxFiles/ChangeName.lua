local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Rio = DevRio:get("TroxTeam:Name"..result.id_)
if not result.first_name_ then 
if Rio then 
DevRio:del("TroxTeam:Name"..result.id_) 
end
end
if result.first_name_ then 
if Rio and Rio ~= result.first_name_ then 
local Rio_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
Rios = math.random(#Rio_text)
Dev_Rio(msg.chat_id_, msg.id_, 1, Rio_text[Rios], 1, 'html')
end  
DevRio:set("TroxTeam:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
Trox = ChangeName
}