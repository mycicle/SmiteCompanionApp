"""
Main entrypoint. This will open an interface for me to choose what to do

to start with it will request the smite API and persist the information
"""
import sqlite3
from sqlite3.dbapi2 import connect
import aiohttp
import asyncio
import datetime
import hashlib 

DB_PATH: str = "/Users/mycicle/git/SmiteCompanionApp/server/src/sql.db"
SMITEAPI_BASE: str = "https://api.smitegame.com/smiteapi.svc"
DEVID: str = "aaaa"
LANGUAGE_CODE: str = "1"
def now():
    return datetime.datetime.utcnow().strftime('%Y%m%d%H%M%S')

def connect_db(path: str):
    conn = None
    try: 
        conn = sqlite3.connect(path)
        return conn
    except Exception as e:
        print(e)
    finally:
        if conn:
            conn.close()

def create_table(conn, request):
    try:
        c = conn.cursor()
        c.execute(request)
    except Exception as e:
        print(e)

def create_smiteapi_signature(method):
    authKey = "aaaa"
    timestamp = now()

    signature_input = f"{DEVID}{method}{authKey}{timestamp}"
    print(signature_input)
    return hashlib.md5(signature_input.encode()).hexdigest()

def build_getx_link(response_format, smiteapi_session, noLC=False):
    signature = create_smiteapi_signature(response_format[:-4])
    timestamp = now()
    if noLC:
        return "/".join([SMITEAPI_BASE, response_format, DEVID, signature, smiteapi_session, timestamp])
    else:
        return "/".join([SMITEAPI_BASE, response_format, DEVID, signature, smiteapi_session, timestamp, LANGUAGE_CODE])


async def get(aio_session, link, name = ""):
    async with aio_session.get(link) as resp:
        print(f"{name} status is: {resp.status}")
        return await resp.text()

async def create_smiteapi_session(aio_session):
    """
    /createsession[ResponseFormat]/{developerId}/{signature}/{timestamp}
        A required step to Authenticate the developerId/signature for further API use.
    """
    signature = create_smiteapi_signature("createsession")
    response_format = "createsessionJson"
    timestamp = now()
    get_session_link: str = "/".join([SMITEAPI_BASE, response_format, DEVID, signature, timestamp])
    print(get_session_link)

    return await get(aio_session, get_session_link, name="getsession")

async def get_gods(aio_session, smiteapi_session):
    """
    /getgods[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}/{languageCode}
    Returns all Gods and their various attributes.
    """
    response_format = "getgodsJson"
    get_gods_link = build_getx_link(response_format, smiteapi_session)
    print(get_gods_link)

    return await get(aio_session, get_gods_link, name="getgods")

async def get_items(aio_session, smiteapi_session):
    """
    /getitems[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}/{languagecode}
    Returns all Items and their various attributes.
    """
    response_format = "getitemsJson"
    get_items_link = build_getx_link(response_format, smiteapi_session)
    print(get_items_link)

    return await get(aio_session, get_items_link, name="getitems")

async def get_god_abilities(aio_session, smiteapi_session):
    """
    /getgodaltabilities[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}
    Returns alt abilities for all gods.   [SmiteAPI only]
    """
    response_format = "getgodaltabilitiesJson"
    get_god_abilities_link = build_getx_link(response_format, smiteapi_session, noLC=True)
    print(get_god_abilities_link)

    return await get(aio_session, get_god_abilities_link, name="getgodaltabilities")

async def main() -> None: 
    print("hello world")
    #conn = connect_db(DB_PATH)
    async with aiohttp.ClientSession() as aio_session:
        smiteapi_session = "aaaa" # await create_smiteapi_session(aio_session) # that will return json, need to extract sessionid. I just did it manually
        gods = await get_gods(aio_session, smiteapi_session)
        items = await get_items(aio_session, smiteapi_session)
        abilities = await get_god_abilities(aio_session, smiteapi_session)
    
    with open("session_info.txt", "a") as file:
        file.write(smiteapi_session)
    with open("getgods.txt", "a") as file:
        file.write(gods)
    with open("getitems.txt", "a") as file:
        file.write(items)
    with open("getgodaltabilities.txt", "a") as file:
        file.write(abilities)




if __name__ == "__main__":
    asyncio.run(main())