Config = {}

Config.BottleItem = 'laptop'

Config.Framework = 'qb'

Config.PersistNotify = function()
exports['t-notify']:Persist({
id = 'smashbottlehelp',
    step = 'start',
    options = {
        style = 'message',
        title = 'Bottle',
        message = 'Smash Bottle: [E], Cancel: [X]',
        sound = true
    }
    })
end

Config.EndPersistNotify = function()
exports['t-notify']:Persist({
    id = 'smashbottlehelp',
    step = 'end'
})
end