local windUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local coin

local cfg = { autoFlip = false }

local window = windUI:CreateWindow({
    Title = "Just Flip Bro | script",
    Icon = "cat",
    Author = "by k1llm3sixy",
    Folder = "jfp",
})

window:OnDestroy(function()
    cfg.autoFlip = false
end)

window:EditOpenButton({
    Title = "Open",
    Icon = "chevrons-left-right-ellipsis",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local mainTab = window:Tab({ Title = "Main" })

mainTab:Toggle({
    Title = "Auto flip",
    Icon = "check",
    Default = false,
    Callback = function(state)
        cfg.autoFlip = state
        toggleAutoFlip()
    end
})

for _, obj in pairs(workspace:GetChildren()) do
    if obj.Name ~= "Coin" then continue end
    local cd = obj:FindFirstChild("ClickDetector")
    if cd and cd:IsA("ClickDetector") then
        coin = cd
        break
    else
        windUI:Notify({
            Title = "Auto flip",
            Content = "Coin click detector not found!",
            Duration = 6.0,
            Icon = "bell",
        })
        break
    end
end

function toggleAutoFlip()
    while cfg.autoFlip do
        fireclickdetector(coin)
        task.wait(0.2)
    end
end
