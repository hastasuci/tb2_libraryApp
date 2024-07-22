import json
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional
import logging
from db_perpustakaan import conn

app = FastAPI()

# Logger
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# Class Buku 
class Buku:
    def __init__(self, judul, penulis, penerbit, tahun_terbit, konten, iktisar):
        self.judul = judul
        self.penulis = penulis
        self.penerbit = penerbit
        self.tahun_terbit = tahun_terbit
        self.konten = konten
        self.iktisar = iktisar
# Method read
    def read(self, start_page: int, end_page: int):
        if start_page <= 0 or end_page > len(self.konten):
            raise ValueError("Error: Nomor halaman tidak sesuai.")
        return self.konten[:end_page]
# Method str
    def __str__(self):
        return f"{self.judul} by {self.penulis}"


# Define data buku
class BukuSchema(BaseModel):
    id: Optional[int] = None
    judul: str
    penulis: str
    penerbit: str
    tahun_terbit: int
    konten: List[str]
    iktisar: str


# Post
@app.post("/buku/", response_model=BukuSchema)
def create_buku(buku: BukuSchema):
    logger.info(f"Mencoba menambahkan data buku baru: {buku}")
    try:
        cursor = conn.cursor()
        sql = "INSERT INTO buku (judul, penulis, penerbit, tahun_terbit, konten, iktisar) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (buku.judul, buku.penulis, buku.penerbit, buku.tahun_terbit, '\n'.join(buku.konten), buku.iktisar)
        cursor.execute(sql, val)
        conn.commit()
        buku.id = cursor.lastrowid
        cursor.close()
        return buku
    except Exception as e:
        logger.error(f"Error ketika menambahkan data buku buku: {e}")
        raise HTTPException(status_code=500, detail="Internal Server Error")


# Get
@app.get("/buku/{buku_id}", response_model=BukuSchema)
def read_buku(buku_id: int):
    logger.info(f"Mencoba membaca data dengan ID buku: {buku_id}")
    try:
        cursor = conn.cursor()
        query = "SELECT id, judul, penulis, penerbit, tahun_terbit, konten, iktisar FROM buku WHERE id=%s"
        cursor.execute(query, (buku_id,))
        item = cursor.fetchone()
        cursor.close()
        if item is None:
            raise HTTPException(status_code=404, detail="Buku tidak ditemukan")
        
        return BukuSchema(
            id=item[0],
            judul=item[1],
            penulis=item[2],
            penerbit=item[3],
            tahun_terbit=item[4],
            konten=json.loads(item[5]),
            iktisar=item[6]
        )
    except HTTPException as e: # HTTPException jika buku tidak ditemukan
        logger.warning(f"Buku tidak ditemukan: {buku_id}")
        raise e
    except Exception as e:
        logger.error(f"Error ketika membaca data buku: {e}")
        raise HTTPException(status_code=500, detail="Internal Server Error")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="localhost", port=8080)