
TrackingPlayer = ""
loadstring(readfile("VR64/currentPlayer.txt"))()


armACF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

armBCF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

armCCF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

armDCF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

headCF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

legACF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

legBCF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

torsoCF = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

hatR = 1

skinR = 1

mapR = "Hub"
playermap = "Hub"
message = ""
text = ""
playerTable = "PlayerTable = {}"
fakeTable = "fakeTable = {}"
messagetext = "usermessage = '' \n messageuser = '' "
	
	plamer = game.workspace.plam[game:GetService("Players").LocalPlayer.Name]
	local mt = getrawmetatable(game)
	local namecall = mt.__namecall
	setreadonly(mt,false)
	mt.__namecall = newcclosure(function(self, ...)
		local args = {...}   
		if getnamecallmethod() == 'FireServer' and self.Name == 'replicate' then
			if not checkcaller() then
				return
			end
		end
		return namecall(self, table.unpack(args))
	end)
	setreadonly(mt,true)

    chat = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering
    chat.OnClientEvent:Connect(function(arg1, arg2)
        if arg1["FromSpeaker"] ~= "VR64BOT" then
            messagetext = "usermessage = '".. arg1["Message"].. " '\n".. "messageuser = '".. arg1["FromSpeaker"].. "'\n"
            writefile("VR64/OtherChat.txt", messagetext)
        end
    end)
    
    	function loadmap(map, where)
			local tp = game.ReplicatedFirst.TeleMap:Clone()
			tp.to.Value = map
			tp.where.Value = where
			tp.Position = game.Workspace.char.Position
			tp.Parent = workspace
			game.Workspace.char.Position = Vector3.new(game.Workspace.char.Position.X, game.Workspace.char.Position.Y + 1, game.Workspace.char.Position.Z)
			game.workspace.char.CanCollide = true
			game.workspace.char.Anchored = false
			wait(2)
			tp:destroy()
	end

rs = game:GetService("RunService")
rs.RenderStepped:Connect(function()
        text = ""
        for i, v in pairs(game.workspace.fakes:GetChildren()) do
            text = text.. "workspace.Share.Replicate:FireServer(table.unpack({[1] = {['armA'] = CFrame.new("..tostring(v.armA.CFrame).."),\n['armB'] = CFrame.new("..tostring(v.armB.CFrame).."),\n['armC'] = CFrame.new("..tostring(v.armC.CFrame).."),\n['armD'] = CFrame.new("..tostring(v.armD.CFrame).."),\n['legA'] = CFrame.new("..tostring(v.legA.CFrame).."),\n['legB'] = CFrame.new("..tostring(v.legB.CFrame).."),\n['torso'] = CFrame.new("..tostring(v.torso.CFrame).."),\n['head'] = CFrame.new("..tostring(v.head.CFrame).."),},\n[2] = '"..v.Name.."'}))\n"
        end
        local replay = text.. "\n".. playerTable.. "\n".. fakeTable
        writefile("VR64/replay.txt", replay)
        loadstring(readfile("VR64/master.txt"))()
		    workspace.share.replicate:FireServer(table.unpack({
		    [1] = game.workspace.plam[game:GetService("Players").LocalPlayer.Name],
			[2] = {
				["legA"] = legACF - legACF.Position,
				["hasfly"] = false,
				["scale"] = Vector3.new(1, 1, 1),
				["torso"] = torsoCF,
				["hastoy"] = false,
				["armC"] = armCCF - armCCF.Position,
				["skin"] = skinR ,
				["map"] = mapR,
				["hat"] = hatR,
				["hasboard"] = false,
				["head"] = headCF - headCF.Position,
				["armB"] = armBCF - armBCF.Position,
				["armD"] = armDCF - armDCF.Position,
				["skate"] = false,
				["legB"] = legBCF - legBCF.Position,
				["hasflame"] = false,
				["health"] = 4,
				["faceid"] = 0,
				["bees"] = false,
				["mps"] = torsoCF,
				["armA"] = armACF - armACF.Position,
			},
		}))
end)

while wait(1) do
    bat = game.ReplicatedFirst.battery:Clone()
    bat.Transparency = 1
    bat.Parent = workspace
    bat.Position = game.workspace.char.Position
    loadstring(readfile("VR64/PlayerChat.txt"))()
    game.workspace.char.CFrame = torsoCF 
            if #Game.workspace.fakes:GetChildren() <= 1 then
            playerTable = "PlayerTable = {}"
        else
            playerTable = "PlayerTable = {"
            for i, v in pairs(game.workspace.fakes:GetChildren()) do
                if v.Name ~= TrackingPlayer then
                    playerTable = playerTable.. "'" .. v.Name.."'".. ","
                end
            end
            playerTable = playerTable:sub(0, -2)
            playerTable = playerTable.. "}"
            for i, v in pairs(game.workspace.fakes:GetChildren()) do
                if v.Name ~= TrackingPlayer then
                    text = text.. "workspace.Share.Replicate:FireServer(table.unpack({[1] = {['armA'] = CFrame.new("..tostring(v.armA.CFrame).."),\n['armB'] = CFrame.new("..tostring(v.armB.CFrame).."),\n['armC'] = CFrame.new("..tostring(v.armC.CFrame).."),\n['armD'] = CFrame.new("..tostring(v.armD.CFrame).."),\n['legA'] = CFrame.new("..tostring(v.legA.CFrame).."),\n['legB'] = CFrame.new("..tostring(v.legB.CFrame).."),\n['torso'] = CFrame.new("..tostring(v.torso.CFrame).."),\n['head'] = CFrame.new("..tostring(v.head.CFrame).."),},\n[2] = '"..v.Name.."'}))\n"
                end
            end
        end
        
        if #Game.Players:GetChildren() <= 1 then
            fakeTable = "fakeTable = {}"
        else
            fakeTable = "fakeTable = {"
            for i, v in pairs(game.Players:GetPlayers()) do 
                fakeTable = fakeTable.. "'" .. v.Name.."'".. ","
            end
            fakeTable = fakeTable:sub(0, -2)
            fakeTable = fakeTable.. "}" 
        end
    if message ~= "" then
		    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(table.unpack({    [1] = message,    [2] = "All",}))
		    message = ""
		    writefile("VR64/PlayerChat.txt",message)
    end
    	if game.workspace.char.Anchored == false then
		    game.workspace.char.Anchored = true
		    game.workspace.char.CanCollide = false
		end

		if playermap ~= mapR then
		   loadmap(mapR, torsoCF.Position) 
		end
		playermap = mapR
	bat:destroy()
end
