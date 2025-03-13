local M = {}

-- 安装依赖（需要先执行以下命令）：
-- luarocks install lua-requests
-- luarocks install lua-cjson
local requests = require("requests")
local cjson = require("cjson")

-- 地理坐标缓存（示例坐标-北京）
local GEO_CACHE = {
    latitude = 39.9042,
    longitude = 116.4074,
}

-- 获取实时天气数据
function M.get_current_weather()
    local base_url = "https://api.open-meteo.com/v1/forecast"

    -- 构造API请求参数
    local params = {
        latitude = GEO_CACHE.latitude,
        longitude = GEO_CACHE.longitude,
        current = "temperature_2m,weather_code,wind_speed_10m,precipitation",
        timezone = "auto",
        forecast_days = 1,
    }

    -- 发送HTTP请求
    local response, err = pcall(function()
        return requests.get(base_url, { params = params })
    end)

    if not response or err then
        return nil, "API请求失败: " .. (err or "未知错误")
    end

    local data = cjson.decode(response.text)

    -- 错误处理
    if not data.current then
        return nil, data.reason or "无效的API响应"
    end

    return {
        temp = data.current.temperature_2m,
        code = data.current.weather_code,
        wind = data.current.wind_speed_10m,
        rain = data.current.precipitation,
        units = data.current_units,
    }
end

-- 天气代码转中文描述
function M.weather_code_to_text(code)
    local weather_map = {
        [0] = "晴",
        [1] = "大部分晴朗",
        [2] = "局部多云",
        [3] = "多云",
        [45] = "雾",
        [48] = "冻雾",
        [51] = "小雨",
        [53] = "中雨",
        [55] = "大雨",
        [56] = "冻雨",
        [57] = "强冻雨",
        [61] = "小雨",
        [63] = "中雨",
        [65] = "大雨",
        [66] = "冰雹雨",
        [67] = "冰雹大雨",
        [71] = "小雪",
        [73] = "中雪",
        [75] = "大雪",
        [77] = "冰雹",
        [80] = "短时小雨",
        [81] = "短时中雨",
        [82] = "短时大雨",
        [85] = "短时小雪",
        [86] = "短时大雪",
        [95] = "雷阵雨",
        [96] = "雷阵雨伴冰雹",
        [99] = "强雷阵雨伴冰雹",
    }
    return weather_map[code] or "未知天气"
end

-- 生成格式化天气报告
function M.generate_weather_report()
    local weather, err = M.get_current_weather()
    if not weather then
        return "⚠️ 天气获取失败: " .. err
    end

    return string.format(
        "🌤️ 天气: %s\n🌡️ 温度: %.1f%s\n🌧️ 降水: %.1fmm\n🍃 风速: %.1f%s",
        M.weather_code_to_text(weather.code),
        weather.temp,
        weather.units.temperature_2m,
        weather.rain,
        weather.wind,
        weather.units.wind_speed_10m
    )
end

return M
