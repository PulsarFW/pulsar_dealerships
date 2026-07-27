fx_version 'cerulean'
game 'gta5'

name 'Pulsar Dealerships'
description 'Vehicle sales: showrooms, catalog browsing, test drives, and rentals'
author 'Artmines - maintained for Pulsar Framework'
url 'https://pulsarframe.work'
version 'v1.0.0'

version_check 'yes'
github 'https://github.com/PulsarFW/pulsar_dealerships'

client_script '@pulsar_core/components/cl_error.lua'
shared_script '@pulsar_core/core/sh_pulsar.lua'
client_script '@pulsar_pwnzor/client/check.lua'

server_scripts({
	'server/server.lua',
	'server/startup.lua',
	'server/stock.lua',
	'server/management.lua',
	'server/showroom.lua',
	'server/records.lua',
	'server/rentals.lua',
	'server/sales.lua',
	'server/gov_fleets.lua',
	'server/donor_dealerships.lua',
})

client_scripts({
	'client/utils.lua',
	'client/client.lua',
	'client/showroom.lua',
	'client/catalog.lua',
	'client/employee/*.lua',
	'client/rentals.lua',
	'client/bike_stand.lua',
	'client/gov_fleets.lua',
	'client/donor_dealerships.lua',
	'client/testdrive.lua',
})

shared_scripts({
	'config/*.lua',
	'shared/*.lua',
})

lua54 'yes'