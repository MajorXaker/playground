import asyncio

import asyncpg
from sqlalchemy import text, create_engine
from sqlalchemy.ext.asyncio import create_async_engine


# async def main():
#     db_url = (
#         "postgresql://postgres:postgres@postgres:5432/postgres"
#     )
#     engine = create_engine(db_url)
#
#     connection = engine.begin()
#     connection.execute(text("select 'OK'"))
#     connection.close_with_result()

async def main():
    db_url = (
        f"postgresql://postgres:postgres@localhost:5432/postgres"
    )
    print(f"Starting connection on '{db_url}'")
    conn = await asyncpg.connect(db_url)
    print(await conn.execute("select 'OK'"))
    await conn.close()


if __name__ == "__main__":
    asyncio.run(main())
