local showroomsLoaded = false

local _dealerShowroomsTableReady = false
local function ensureDealerShowroomsTable(callback)
    if _dealerShowroomsTableReady then
        if callback then
            callback()
        end
        return
    end
    plsr.Database:Query(
        "CREATE TABLE IF NOT EXISTS `dealer_showrooms` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `dealership` VARCHAR(191) NOT NULL, `data` JSON NOT NULL, UNIQUE INDEX `idx_dealership` (`dealership`))",
        nil,
        function()
            _dealerShowroomsTableReady = true
            if callback then
                callback()
            end
        end
    )
end

DEALERSHIPS.Showroom = {
    Load = function(self)
        local p = promise.new()
        ensureDealerShowroomsTable(function()
            plsr.Database:Query("SELECT `dealership`, `data` FROM `dealer_showrooms`", nil, function(success, results)
                local showRoomData = {}
                if success and #results > 0 then
                    for k, row in ipairs(results) do
                        if _dealerships[row.dealership] then
                            local ok, showroom = pcall(json.decode, row.data)
                            showRoomData[row.dealership] = (ok and type(showroom) == "table") and showroom or {}
                        end
                    end

                    GlobalState.DealershipShowrooms = showRoomData
                    showroomsLoaded = true
                end
                p:resolve(success)
            end)
        end)
        return Citizen.Await(p)
    end,

    Update = function(self, dealershipId, showroom)
        if _dealerships[dealershipId] then
            if type(showroom) ~= 'table' then
                showroom = {}
            end

            local p = promise.new()
            ensureDealerShowroomsTable(function()
                plsr.Database:Update(
                    "INSERT INTO `dealer_showrooms` (`dealership`, `data`) VALUES (?, ?) ON DUPLICATE KEY UPDATE `data` = VALUES(`data`)",
                    { dealershipId, json.encode(showroom) },
                    function(success)
                        if success then
                            -- FiveM is dumb
                            local currentData = GlobalState.DealershipShowrooms
                            currentData[dealershipId] = showroom
                            GlobalState.DealershipShowrooms = currentData

                            TriggerClientEvent('Dealerships:Client:ShowroomUpdate', -1, dealershipId)
                            p:resolve(showroom)
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
    
    UpdatePos = function(self, dealershipId, position, vehicleData)
        if _dealerships[dealershipId] and (#_dealerships[dealershipId].showroom >= position) then
            position = tostring(position)
            local showroomData = GlobalState.DealershipShowrooms[dealershipId] or {}
            showroomData[position] = type(vehicleData) == 'table' and vehicleData or nil

            return plsr.Dealerships.Showroom:Update(dealershipId, showroomData)
        end
        return false
    end,
}