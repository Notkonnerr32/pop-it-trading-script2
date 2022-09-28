getgenv().sayanswer = true --Broadcast answer to other players [true/false]
local hint = game:GetService("ReplicatedStorage").HintAnswer
local subanswer = game:GetService("ReplicatedStorage").SubmittedAnswer
local chatremote = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest

hint:GetPropertyChangedSignal("Value"):Connect(function()
if hint.Value ~= "" and game.Players.LocalPlayer.Playing.Value == true then
    subanswer:FireServer(hint.Value, string.len(hint.Value))
    if getgenv().sayanswer then
    chatremote:FireServer("The answer is "..hint.Value,"All")
    end
end
end)
