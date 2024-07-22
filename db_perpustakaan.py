import MySQLdb

db_config = {
    'host': 'localhost',
    'user': 'root',
    'passwd': '',
    'db': 'db_perpustakaan',
}

conn = MySQLdb.connect(**db_config)