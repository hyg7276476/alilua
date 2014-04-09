routes = {}
routes['^/(.*).(jpg|gif|png|css|js|ico|swf|flv|mp3|mp4|woff|eot|ttf|otf|svg)'] = function()
    header('Cache-Control: max-age=864000')
    sendfile(headers.uri)
end

routes['^/user/:user_id(.*)'] = function(r)
    print('User ID: ', r.user_id)
end

routes['^/(.*)'] = function(r)
    _print(r)
    for k,v in pairs(r) do _print(k,v) end
    dofile('/index.lua')
end

--[[
others you want :)
]]

if not router(headers.uri, routes) then
    header('HTTP/1.1 404 Not Found')
    die('File Not Found!')
end