from aiohttp import web

routes = web.RouteTableDef()

@routes.get('/hello')
async def hello(request):
    return web.Response(text="Hello world")

@routes.get('/getgods')
async def getgods(request):
    with open("getgods.txt", "r") as file:
        return web.Response(text=file.read())


@routes.get('/getitems')
async def getitems(request):
    with open("getitems.txt", "r") as file:
        return web.Response(text=file.read())

app = web.Application()
app.add_routes(routes)

web.run_app(app)