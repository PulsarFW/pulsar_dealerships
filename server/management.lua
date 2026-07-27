_managementData = {}

local _dealerDataTableReady = false
local function ensureDealerDataTable(callback)
    if _dealerDataTableReady then
        if callback then
            callback()
        end
        return
    end
    plsr.Database:Query(
        "CREATE TABLE IF NOT EXISTS `dealer_data` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `dealership` VARCHAR(191) NOT NULL, `data` JSON NOT NULL, UNIQUE INDEX `idx_dealership` (`dealership`))",
        nil,
        function()
            _dealerDataTableReady = true
            if callback then
                callback()
            end
        end
    )
end

DEALERSHIPS.Management = {
    LoadData = function(self)
        local p = promise.new()
        ensureDealerDataTable(function()
            plsr.Database:Query("SELECT `dealership`, `data` FROM `dealer_data`", nil, function(success, results)
                if success then
                    local loadedByDealer = {}
                    for k, row in ipairs(results) do
                        local ok, decoded = pcall(json.decode, row.data)
                        if ok and type(decoded) == "table" then
                            decoded.dealership = row.dealership
                            loadedByDealer[row.dealership] = decoded
                        end
                    end

                    for k, v in pairs(_dealerships) do
                        if loadedByDealer[k] then
                            _managementData[k] = loadedByDealer[k]
                        else
                            _managementData[k] = _defaultDealershipSalesData
                        end
                    end
                    p:resolve(true)
                else
                    p:resolve(false)
                end
            end)
        end)
        return Citizen.Await(p)
    end,
    SetData = function(self, dealerId, key, val)
        local data = _managementData[dealerId]
        if data then
            local dealerData = table.copy(data)
            dealerData.dealership = nil
            dealerData._id = nil
            dealerData[key] = val

            local p = promise.new()
            ensureDealerDataTable(function()
                plsr.Database:Update(
                    "INSERT INTO `dealer_data` (`dealership`, `data`) VALUES (?, ?) ON DUPLICATE KEY UPDATE `data` = VALUES(`data`)",
                    { dealerId, json.encode(dealerData) },
                    function(success)
                        if success then
                            _managementData[dealerId] = dealerData
                            p:resolve(_managementData[dealerId])
                        else
                            p:resolve(false)
                        end
                    end
                )
            end)
            return Citizen.Await(p)
        end
        return false
    end,
    SetMultipleData = function(self, dealerId, updatingData)
        local data = _managementData[dealerId]
        if data then
            local dealerData = table.copy(data)
            dealerData.dealership = nil
            dealerData._id = nil

            for k, v in pairs(updatingData) do
                dealerData[k] = v
            end

            local p = promise.new()
            ensureDealerDataTable(function()
                plsr.Database:Update(
                    "INSERT INTO `dealer_data` (`dealership`, `data`) VALUES (?, ?) ON DUPLICATE KEY UPDATE `data` = VALUES(`data`)",
                    { dealerId, json.encode(dealerData) },
                    function(success)
                        if success then
                            _managementData[dealerId] = dealerData
                            p:resolve(_managementData[dealerId])
                        else
                            p:resolve(false)
                        end
                    end
                )
            end)
            return Citizen.Await(p)
        end
        return false
    end,
    GetAllData = function(self, dealerId)
        return _managementData[dealerId]
    end,
    GetData = function(self, dealerId, key)
        local data = _managementData[dealerId]
        if data then
            return data[key]
        end
        return false
    end,
}