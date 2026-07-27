local _dealerStockTableReady = false
function EnsureDealerStockTable(callback)
    if _dealerStockTableReady then
        if callback then
            callback()
        end
        return
    end
    plsr.Database:Query(
        "CREATE TABLE IF NOT EXISTS `dealer_stock` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `dealership` VARCHAR(191) NOT NULL, `vehicle` VARCHAR(191) NOT NULL, `model_type` VARCHAR(191) NULL, `quantity` INT NOT NULL DEFAULT 0, `data` JSON NULL, `last_stocked` BIGINT NULL, `last_purchase` BIGINT NULL, UNIQUE INDEX `idx_dealership_vehicle` (`dealership`, `vehicle`))",
        nil,
        function()
            _dealerStockTableReady = true
            if callback then
                callback()
            end
        end
    )
end

local function rowToStock(row)
    if row == nil then
        return nil
    end
    local data = nil
    if row.data then
        local ok, decoded = pcall(json.decode, row.data)
        if ok then
            data = decoded
        end
    end
    return {
        _id = row.id,
        dealership = row.dealership,
        vehicle = row.vehicle,
        modelType = row.model_type,
        quantity = row.quantity,
        data = data,
        lastStocked = row.last_stocked,
        lastPurchase = row.last_purchase,
    }
end

DEALERSHIPS.Stock = {
    FetchAll = function(self)
        local p = promise.new()
        EnsureDealerStockTable(function()
            plsr.Database:Query("SELECT * FROM `dealer_stock`", nil, function(success, results)
                if success then
                    local stock = {}
                    for k, row in ipairs(results) do
                        table.insert(stock, rowToStock(row))
                    end
                    p:resolve(stock)
                else
                    p:resolve(false)
                end
            end)
        end)
        return Citizen.Await(p)
    end,
    FetchDealer = function(self, dealerId)
        local p = promise.new()
        EnsureDealerStockTable(function()
            plsr.Database:Query("SELECT * FROM `dealer_stock` WHERE `dealership` = ?", { dealerId }, function(success, results)
                if success then
                    local stock = {}
                    for k, row in ipairs(results) do
                        table.insert(stock, rowToStock(row))
                    end
                    p:resolve(stock)
                else
                    p:resolve(false)
                end
            end)
        end)
        return Citizen.Await(p)
    end,
    FetchDealerVehicle = function(self, dealerId, vehModel)
        local p = promise.new()
        EnsureDealerStockTable(function()
            plsr.Database:Single("SELECT * FROM `dealer_stock` WHERE `dealership` = ? AND `vehicle` = ?", { dealerId, vehModel }, function(success, row)
                if success and row ~= nil then
                    p:resolve(rowToStock(row))
                else
                    p:resolve(false)
                end
            end)
        end)
        return Citizen.Await(p)
    end,
    HasVehicle = function(self, dealerId, vehModel)
        local vehicle = plsr.Dealerships.Stock:FetchDealerVehicle(dealerId, vehModel)
        if vehicle and vehicle.quantity > 0 then
            return vehicle.quantity
        else
            return false
        end
    end,
    --- Adds stock: increments quantity if the vehicle's already stocked, inserts a new row if no exist
    ---@param dealerId  string  Dealership key from config/dealerships.lua, e.g. "pdm", "tuna"
    ---@param vehModel  string  Vehicle spawn name (lowercase, matches the GTA model hash string)
    ---@param modelType string  "automobile" or "motorcycle" (anything else falls back to automobile downstream)
    ---@param quantity  number  Amount to add
    ---@param vehData   table   { class, price, make, model, category }
    ---@return table| false      { success, existed } on success, false if validation failed
    Add = function(self, dealerId, vehModel, modelType, quantity, vehData)
        vehData = ValidateVehicleData(vehData)
        if _dealerships[dealerId] and vehModel and vehData and quantity > 0 then
            local isStocked = plsr.Dealerships.Stock:FetchDealerVehicle(dealerId, vehModel)
            local p = promise.new()
            EnsureDealerStockTable(function()
                if isStocked then -- The vehicle is already stocked
                    plsr.Database:Update(
                        "UPDATE `dealer_stock` SET `quantity` = `quantity` + ?, `data` = ?, `last_stocked` = ? WHERE `dealership` = ? AND `vehicle` = ?",
                        { quantity, json.encode(vehData), os.time(), dealerId, vehModel },
                        function(success, result)
                            if success and result > 0 then
                                p:resolve({
                                    success = true,
                                    existed = true,
                                })
                            else
                                p:resolve(false)
                            end
                        end
                    )
                else
                    plsr.Database:Insert(
                        "INSERT INTO `dealer_stock` (`dealership`, `vehicle`, `model_type`, `data`, `quantity`, `last_stocked`) VALUES (?, ?, ?, ?, ?, ?)",
                        { dealerId, vehModel, modelType, json.encode(vehData), quantity, os.time() },
                        function(success, newId)
                            if success then
                                p:resolve({
                                    success = true,
                                    existed = false,
                                })
                            else
                                p:resolve(false)
                            end
                        end
                    )
                end
            end)
            return Citizen.Await(p)
        end
        return false
    end,
    Increase = function(self, dealerId, vehModel, amount)
        if _dealerships[dealerId] and vehModel and amount > 0 then
            local isStocked = plsr.Dealerships.Stock:FetchDealerVehicle(dealerId, vehModel)
            if isStocked then -- The vehicle is already stocked
                local p = promise.new()
                EnsureDealerStockTable(function()
                    plsr.Database:Update(
                        "UPDATE `dealer_stock` SET `quantity` = `quantity` + ?, `last_stocked` = ? WHERE `dealership` = ? AND `vehicle` = ?",
                        { amount, os.time(), dealerId, vehModel },
                        function(success, result)
                            if success and result > 0 then
                                p:resolve({ success = true })
                            else
                                p:resolve(false)
                            end
                        end
                    )
                end)
                return Citizen.Await(p)
            else
                return false
            end
        end
        return false
    end,
    Update = function(self, dealerId, vehModel, setting)
        if _dealerships[dealerId] and vehModel and type(setting) == "table" then
            local isStocked = plsr.Dealerships.Stock:FetchDealerVehicle(dealerId, vehModel)
            if isStocked then -- The vehicle is already stocked
                local p = promise.new()
                for k, v in pairs(setting) do
                    isStocked[k] = v
                end
                EnsureDealerStockTable(function()
                    plsr.Database:Update(
                        "UPDATE `dealer_stock` SET `model_type` = ?, `quantity` = ?, `data` = ?, `last_stocked` = ?, `last_purchase` = ? WHERE `dealership` = ? AND `vehicle` = ?",
                        {
                            isStocked.modelType,
                            isStocked.quantity,
                            isStocked.data and json.encode(isStocked.data) or nil,
                            isStocked.lastStocked,
                            isStocked.lastPurchase,
                            dealerId,
                            vehModel,
                        },
                        function(success, result)
                            if success and result > 0 then
                                p:resolve({ success = true })
                            else
                                p:resolve(false)
                            end
                        end
                    )
                end)
                return Citizen.Await(p)
            else
                return false
            end
        end
        return false
    end,

    ---@param dealerId  string  Dealership key from config/dealerships.lua, e.g. "pdm", "tuna"
    ---@param vehModel  string  Vehicle spawn name (lowercase, matches the GTA model hash string)
    ---@param modelType string  "automobile" or "motorcycle" (anything else falls back to automobile downstream)
    ---@param quantity  number  Stock level to ensure is available
    ---@param vehData   table   { class, price, make, model, category }
    ---@return table|false      { success, existed } on success, false if nothing needed adding or validation failed
    Ensure = function(self, dealerId, vehModel, modelType, quantity, vehData)
        if _dealerships[dealerId] and vehModel then
            local isStocked = plsr.Dealerships.Stock:FetchDealerVehicle(dealerId, vehModel)
            if isStocked then
                local missingQuantity = quantity - isStocked.quantity
                if missingQuantity >= 1 then
                    return plsr.Dealerships.Stock:Add(dealerId, vehModel, modelType, missingQuantity, vehData)
                end
            else
                return plsr.Dealerships.Stock:Add(dealerId, vehModel, modelType, quantity, vehData)
            end
        end
        return false
    end,
    Remove = function(self, dealerId, vehModel, quantity)
        if _dealerships[dealerId] and vehModel and quantity > 0 then
            local isStocked = plsr.Dealerships.Stock:FetchDealerVehicle(dealerId, vehModel)

            if isStocked and isStocked.quantity > 0 then
                local newQuantity = isStocked.quantity - quantity
                if newQuantity >= 0 then
                    local p = promise.new()
                    EnsureDealerStockTable(function()
                        plsr.Database:Update(
                            "UPDATE `dealer_stock` SET `quantity` = ?, `last_purchase` = ? WHERE `dealership` = ? AND `vehicle` = ?",
                            { newQuantity, os.time(), dealerId, vehModel },
                            function(success, result)
                                if success and result > 0 then
                                    p:resolve(newQuantity)
                                else
                                    p:resolve(false)
                                end
                            end
                        )
                    end)
                    return Citizen.Await(p)
                end
            end
        end
        return false
    end,
}

local requiredAttributes = {
    make = 'string',
    model = 'string',
    class = 'string',
    --category = 'string',
    price = 'number'
}

function ValidateVehicleData(data)
    if type(data) ~= 'table' then
        return false
    end
    for k, v in pairs(requiredAttributes) do
        if data[k] == nil or type(data[k]) ~= v then
            return false
        end
    end

    return data
end
