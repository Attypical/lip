if _G.ExecutedTwice then return end

_G.ExecutedTwice = true
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rain-Design/Libraries/main/Revenant.lua", true))()
local Flags = Library.Flags

Library:Notification({
    Text = "verifying...",
    Duration = 4
})

wait(math.random(1,2.5))
Library:Notification({
    Text = "loaded and up to date, enjoy!",
    Duration = 7
})
local Window = Library:Window({
    Text = "main"
})

local Window2 = Library:Window({
    Text = "airdrops"
})

local Window3 = Library:Window({
    Text = "other"
})


Window:Button({
    Text = "aimlock & esp",
    Callback = function()
    if _G.aimexec then
    Library:Notification({
        Text = "script has already been executed",
        Duration = 3
    })
    return
end

_G.aimexec = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Attypical/lip/refs/heads/main/aim_esp.lua", true))()
        Library:Notification({
            Text = "loaded successfully",
            Duration = 5
        })
    end
})

Window:Button({
    Text = "orca",
    Callback = function()
            if _G.orcaexec then
    Library:Notification({
        Text = "script has already been executed",
        Duration = 3
    })
    return
end

_G.orcaexec = true
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Attypical/orca/master/public/latest.lua"))()
        Library:Notification({
            Text = "loaded successfully",
            Duration = 5
        })
    end
})


Window2:Button({
    Text = "search for airdrops",
    Callback = function()
        local cratesFound = false

        for _, crate in ipairs(game.Workspace.RuntimeObjects.Props:GetChildren()) do
            if crate:IsA("Model") and crate.Name == "AirdropCrate" then
                cratesFound = true

                local cratePart = crate.PrimaryPart
                if cratePart then
                    local marker = Instance.new("BillboardGui")
                    marker.Name = "CrateMarker"
                    marker.Size = UDim2.new(0, 100, 0, 50) 
                    marker.StudsOffset = Vector3.new(0, 5, 0)  
                    marker.AlwaysOnTop = true
                    marker.Parent = cratePart

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Text = "Airdrop Crate"
                    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    textLabel.TextScaled = true
                    textLabel.Parent = marker
                end
            end
        end

        if cratesFound then
            Library:Notification({
                Text = "airdrop(s) found!",
                Duration = 5
            })
        else
            Library:Notification({
                Text = "no airdrops found :(",
                Duration = 5
            })
        end
    end
})

Window2:Button({
    Text = "* auto airdrop searcher",
    Callback = function()
        _G.enabled = true
        Library:Notification({
            Text = "started successfully",
            Duration = 5
        })

        local markedCrates = {}

        while _G.enabled and wait(2) do
            local cratesFound = false

            for _, crate in ipairs(game.Workspace.RuntimeObjects.Props:GetChildren()) do
                if crate:IsA("Model") and crate.Name == "AirdropCrate" then

                    if not markedCrates[crate] then
                        cratesFound = true
                        markedCrates[crate] = true 

                        local cratePart = crate.PrimaryPart
                        if cratePart then
                            local marker = cratePart:FindFirstChild("CrateMarker")
                            if not marker then
                                marker = Instance.new("BillboardGui")
                                marker.Name = "CrateMarker"
                                marker.Size = UDim2.new(0, 100, 0, 50)
                                marker.StudsOffset = Vector3.new(0, 5, 0)
                                marker.AlwaysOnTop = true
                                marker.Parent = cratePart

                                local textLabel = Instance.new("TextLabel")
                                textLabel.Size = UDim2.new(1, 0, 1, 0)
                                textLabel.BackgroundTransparency = 1
                                textLabel.Text = "Airdrop Crate"
                                textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                textLabel.TextScaled = true
                                textLabel.Parent = marker
                            end
                        end
                    end
                end
            end

            if cratesFound then
                Library:Notification({
                    Text = "airdrop(s) found!",
                    Duration = 5
                })
            end
        end
    end
})
Window2:Button({
    Text = "* turn off",
    Callback = function()
        _G.enabled = false
        Library:Notification({
            Text = "stopped successfully",
            Duration = 5
        })
    end
})

Window3:Keybind({
    Text = "toggle",
    Default = Enum.KeyCode.Equals,
    Callback = function()
        Library:Toggle()
    end
})
