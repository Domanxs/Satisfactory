---------------------------------------------------------------------
--MASTER FILE BY SHAGIS
---------------------------------------------------------------------
-- Utils
function lerp(a, b, t)
    return a + (b - a) * t
end

function GetComponent(componentName)
    return component.proxy(component.findComponent(componentName))[1]
end

function GetPercent(normalisedVariable)
    return string.format("%.0f", normalisedVariable * 100) .. "%"
end

function GetAllClasses(class)
    return component.proxy(component.findComponent(findClass(class)))
end

function GetGroup(group)
    return component.proxy(component.findComponent(group))
end

function BoolString(bool)
    if bool == true then
        return "ON"
    end
    if bool == false then
        return "OFF"
    end
end

-- Colors
ColorRed = { 0.3, 0, 0, 1 }
ColorGreen = { 0, 0.3, 0, 1 }

function LerpColor(col1, col2, time)
    r = lerp(col1[1], col2[1], time)
    g = lerp(col1[2], col2[2], time)
    b = lerp(col1[3], col2[3], time)
    return { r, g, b, 1 }
end

-- Fluid buffers
function BufferContentNormalised(buffer)
    return buffer.fluidContent / buffer.maxFluidContent
end

-- Signs

function SetSignIcon(sign, iconIndex)
    data = sign:getPrefabSignData()
    if data:getIconElement("Icon") == iconIndex then
        return
    end
    event.pull(0.01)
    data:setIconElement("Icon", iconIndex)
    sign:setPrefabSignData(data)
end

function SetSignColor(sign, color)
    data = sign:getPrefabSignData()
    if data.background == color then
        return
    end
    event.pull(0.01)
    data.background = color
    sign:setPrefabSignData(data)
end

function SetSignMainText(sign, text)
    data = sign:getPrefabSignData()
    if data:getTextElement("Name") == text then
        return
    end
    event.pull(0.01)
    data:setTextElement("Name", text)
    sign:setPrefabSignData(data)
end

function SetSignSecondaryText(sign, text)
    data = sign:getPrefabSignData()
    if data:getTextElement("Label") == text then
        return
    end
    event.pull(0.01)
    data:setTextElement("Label", text)
    sign:setPrefabSignData(data)
end

function SetSignText(sign, mainText, secondaryText)
    SetSignMainText(sign, secondaryText)
    SetSignSecondaryText(sign, mainText)
end

--Load Drive
--fs = filesystem
--fs.initFileSystem("/dev")
--fs.mount("/dev/" .. fs.childs("/dev")[1], "/")
--program = fs.loadFile("program.lua")()
--program = nil