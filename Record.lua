
    TrackingPlayer = ""
    
    loadstring(readfile("VR64/currentPlayer.txt"))()
    
    game.Workspace.Share.CurrentPlayer:FireServer(TrackingPlayer)
    dummy = game:GetService("Workspace"):WaitForChild(TrackingPlayer)
	betterarms = game:GetService("Workspace"):WaitForChild("fakes")[TrackingPlayer]
	armA = ""
	armB = ""
	armC = ""
	armD = ""
	head = ""
	legA = ""
	legB = ""
	torso = ""
	master = ""
	
	hat = ""
	skin = ""
	map = ""
	chatted = ""
	PlayerTable = {}
	fakeTable = {}
	oldlist = {}
	chatted = "message = ''"
	
	framecount = 0
	firststring = ""
	status = "NEUTRAL"

    uis = game:GetService("UserInputService")
    uis.InputBegan:Connect(function(input, Typing)
        if Typing then return end
		if input.KeyCode == Enum.KeyCode.R then
			if status == "RECORD" then
			    status = "NEUTRAL"
			    print("Stopped recording")
			    framecount = 0
			elseif status == "NEUTRAL" then
			    status = "RECORD"
			    print("Started recording")
			    framecount = 0
			end
		end
	end)

    chat = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering
    chat.OnClientEvent:Connect(function(arg1, arg2)
        if arg1["FromSpeaker"] == TrackingPlayer then
            chatted = "\n message = '".. arg1["Message"].."'"
            writefile("VR64/PlayerChat.txt",chatted)
        end
    end)

	rs = game:GetService("RunService")
	rs.RenderStepped:Connect(function()
		if status == "RECORD" then
		    dummy = game:GetService("Workspace"):WaitForChild(TrackingPlayer)
		    loadstring(readfile("VR64/OtherChat.txt"))()
		    loadstring(readfile("VR64/replay.txt"))()
		    
		    for i, v in pairs(game.Workspace.Replicate:GetChildren()) do
		    if not table.find(PlayerTable, v.Name) then
		      game:GetService("Workspace").Share.Delete:FireServer(v.Name)
		    end
		    end
		    
		    if usermessage ~= "" then
            game:GetService("Workspace").Share.Chat:FireServer(tostring('['..messageuser..']: '.. usermessage))
		    end
		    
		    framecount = framecount + 1
		    hat = "\n hatR = " ..tostring(game:GetService("Players").LocalPlayer.PlayerGui.vr64.HatValue.Text)
		    skin = "\n skinR = " ..tostring(game:GetService("Players").LocalPlayer.PlayerGui.vr64.SkinValue.Text)
		    map = "\n mapR = '" ..tostring(game:GetService("Players").LocalPlayer.PlayerGui.vr64.MapValue.Text).. "'"
		    
			armA = "\n armACF = CFrame.new(" ..tostring(betterarms.armA.CFrame).. ")"
			armB =  "\n armBCF = CFrame.new(" ..tostring(betterarms.armB.CFrame).. ")"
			armC =  "\n armCCF = CFrame.new(" ..tostring(betterarms.armC.CFrame).. ")"
			armD =  "\n armDCF = CFrame.new(" ..tostring(betterarms.armD.CFrame).. ")"
			head =  "\n headCF = CFrame.new(" ..tostring(dummy.Head.CFrame).. ")"
			legA =  "\n legACF = CFrame.new(" ..tostring(dummy.RightLowerLeg.CFrame).. ")"
			legB =  "\n legBCF = CFrame.new(" ..tostring(dummy.LeftLowerLeg.CFrame).. ")"
			torso = "\n torsoCF = CFrame.new(" ..tostring(dummy.UpperTorso.CFrame).. ")"
			master = armA.. "\n"..armB.. "\n"..armC.. "\n"..armD.. "\n"..head.. "\n"..legA.. "\n"..legB.. "\n"..torso.. "\n".. hat.. "\n".. skin.. "\n".. map
            writefile("VR64/master.txt",master)
            
            if usermessage ~= "" then
            messagetext = "usermessage = '' \n messageuser = '' "
            writefile("VR64/OtherChat.txt", messagetext)
		    end
            
            if #oldlist ~= #fakeTable then
		        game:GetService("Workspace").Share.List:FireServer(fakeTable)
		    end
		    oldlist = fakeTable
		end
	end)

