local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rain-Design/Libraries/main/Revenant.lua", true))()
local Flags = Library.Flags

Library:Notification({
    Text = "verifying...",
    Duration = 4
})

wait(math.random(1, 2.5))

Library:Notification({
    Text = "loaded and up to date, enjoy!",
    Duration = 7
})

local mainWindow = Library:Window({ Text = "main" })
local airdropWindow = Library:Window({ Text = "airdrops" })
local otherWindow = Library:Window({ Text = "other" })

mainWindow:Button({
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

mainWindow:Button({
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

airdropWindow:Button({
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

airdropWindow:Button({
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
                         --[[   if game.Players.LocalPlayer.Name ~= "hurrtfull" then
                                wait(1.5)
                            end--]]
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

airdropWindow:Button({
    Text = "* turn off",
    Callback = function()
        _G.enabled = false
        Library:Notification({
            Text = "stopped successfully",
            Duration = 5
        })
    end
})

otherWindow:Keybind({
    Text = "toggle",
    Default = Enum.KeyCode.Equals,
    Callback = function()
        Library:Toggle()
    end
})

otherWindow:Button({
    Text = "use old lighting",
    Callback = function()
local lighting = game:GetService("Lighting")
local colorcorrection = lighting.ColorCorrection
local atm = lighting.Atmosphere
    atm.Density = 0.3
    atm.Offset = 0.7
    colorcorrection.TintColor = Color3.fromRGB(255, 255, 255)
    colorcorrection.Brightness = 0.1
    colorcorrection.Brightness = 0.1
    colorcorrection.Saturation = 1.1
        Library:Notification({
            Text = "applied successfully",
            Duration = 5
        })
    end
})
