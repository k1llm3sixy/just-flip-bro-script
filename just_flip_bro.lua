local windUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

math.randomseed(os.time())

local rs = game:GetService("ReplicatedStorage")
local flipRemote = rs:FindFirstChild("sendRoll")

local cfg = {
    autoFlip = false,
    flipType = ""
}

local flipTypes = {
    "Heads",
    "Tails",
    "Random"
}

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

mainTab:Dropdown({
    Title = "Flip type",
    Values = flipTypes,
    Value = flipTypes[1],
    Callback = function(type)
        cfg.flipType = type
    end
})

function toggleAutoFlip()
    while cfg.autoFlip do
        if cfg.flipType == "Random" then
            local random = math.random(1, 2)
            flipRemote:InvokeServer(flipTypes[random])
            else
                flipRemote:InvokeServer(cfg.flipType)
        end
        task.wait(0.1)
    end
end
