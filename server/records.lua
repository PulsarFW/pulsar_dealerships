-- Dealership Sale Records

local _dealerRecordsTableReady = false
local function ensureDealerRecordsTable(callback)
    if _dealerRecordsTableReady then
        if callback then
            callback()
        end
        return
    end
    plsr.Database:Query(
        "CREATE TABLE IF NOT EXISTS `dealer_records` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `dealership` VARCHAR(191) NOT NULL, `time` BIGINT NOT NULL, `category` VARCHAR(191) NULL, `data` JSON NOT NULL, INDEX `idx_dealership_time` (`dealership`, `time`), INDEX `idx_dealership_category` (`dealership`, `category`))",
        nil,
        function()
            plsr.Database:Query(
                "CREATE TABLE IF NOT EXISTS `dealer_records_buybacks` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, `dealership` VARCHAR(191) NOT NULL, `data` JSON NOT NULL, INDEX `idx_dealership` (`dealership`))",
                nil,
                function()
                    _dealerRecordsTableReady = true
                    if callback then
                        callback()
                    end
                end
            )
        end
    )
end

local function rowToRecord(row)
    local ok, decoded = pcall(json.decode, row.data)
    if not ok or type(decoded) ~= "table" then
        return nil
    end
    decoded._id = row.id
    return decoded
end

DEALERSHIPS.Records = {
    Get = function(self, dealership)
        if _dealerships[dealership] then
            local p = promise.new()
            ensureDealerRecordsTable(function()
                plsr.Database:Query(
                    "SELECT `id`, `data` FROM `dealer_records` WHERE `dealership` = ? ORDER BY `time` DESC LIMIT 100",
                    { dealership },
                    function(success, results)
                        if success then
                            local records = {}
                            for k, row in ipairs(results) do
                                local record = rowToRecord(row)
                                if record then
                                    table.insert(records, record)
                                end
                            end
                            p:resolve(records)
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
    GetPage = function(self, category, term, dealership, page, perPage)
        if _dealerships[dealership] then
            local p = promise.new()

            local skip = 0
            if page > 1 then
                skip = perPage * (page - 1)
            end

            local whereClauses = { "`dealership` = ?" }
            local params = { dealership }

            if #term > 0 then
                local like = "%" .. term .. "%"
                table.insert(
                    whereClauses,
                    "(CONCAT(JSON_UNQUOTE(JSON_EXTRACT(`data`, '$.seller.First')), ' ', JSON_UNQUOTE(JSON_EXTRACT(`data`, '$.seller.Last'))) LIKE ? "
                        .. "OR CONCAT(JSON_UNQUOTE(JSON_EXTRACT(`data`, '$.buyer.First')), ' ', JSON_UNQUOTE(JSON_EXTRACT(`data`, '$.buyer.Last'))) LIKE ? "
                        .. "OR CONCAT(JSON_UNQUOTE(JSON_EXTRACT(`data`, '$.vehicle.data.make')), ' ', JSON_UNQUOTE(JSON_EXTRACT(`data`, '$.vehicle.data.model'))) LIKE ?)"
                )
                table.insert(params, like)
                table.insert(params, like)
                table.insert(params, like)
            end

            if category ~= "all" then
                table.insert(whereClauses, "`category` = ?")
                table.insert(params, category)
            end

            table.insert(params, perPage + 1)
            table.insert(params, skip)

            ensureDealerRecordsTable(function()
                plsr.Database:Query(
                    "SELECT `id`, `data` FROM `dealer_records` WHERE " .. table.concat(whereClauses, " AND ") .. " ORDER BY `time` DESC LIMIT ? OFFSET ?",
                    params,
                    function(success, results)
                        if success then
                            local records = {}
                            for k, row in ipairs(results) do
                                local record = rowToRecord(row)
                                if record then
                                    table.insert(records, record)
                                end
                            end

                            local more = false
                            if #records > perPage then
                                more = true
                                table.remove(records)
                            end

                            p:resolve({
                                data = records,
                                more = more,
                            })
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
    Create = function(self, dealership, document)
        if type(document) == 'table' then
            document.dealership = dealership
            local p = promise.new()
            local category = document.vehicle and document.vehicle.data and document.vehicle.data.category or nil
            ensureDealerRecordsTable(function()
                plsr.Database:Insert(
                    "INSERT INTO `dealer_records` (`dealership`, `time`, `category`, `data`) VALUES (?, ?, ?, ?)",
                    { dealership, document.time or os.time(), category, json.encode(document) },
                    function(success, newId)
                        p:resolve(success and newId ~= nil)
                    end
                )
            end)
            return Citizen.Await(p)
        end
        return false
    end,
    CreateBuyBack = function(self, dealership, document)
        if type(document) == 'table' then
            document.dealership = dealership
            local p = promise.new()
            ensureDealerRecordsTable(function()
                plsr.Database:Insert(
                    "INSERT INTO `dealer_records_buybacks` (`dealership`, `data`) VALUES (?, ?)",
                    { dealership, json.encode(document) },
                    function(success, newId)
                        p:resolve(success and newId ~= nil)
                    end
                )
            end)
            return Citizen.Await(p)
        end
        return false
    end,
}
