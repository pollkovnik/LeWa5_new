.class public Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "MmsFavoriteSQLiteHelper.java"


# static fields
.field private static final DB_NAME:Ljava/lang/String; = "mmsfrovider.db"

.field private static final DB_VERSION:I = 0x14

.field private static final TABLE_MMSFAVORITE:Ljava/lang/String; = "mms_favorite"

.field private static final TAG:Ljava/lang/String; = "MmsFavoriteProvider"

.field private static countDbCopy:I = 0x0

.field private static final dbPath:Ljava/lang/String; = "/data/data/com.lewa.providers.mmsfavorite/databases"

.field private static final dbPathName:Ljava/lang/String; = "/data/data/com.lewa.providers.mmsfavorite/databases/mmsfrovider.db"

.field private static sInstance:Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;


# instance fields
.field private flagNeedReopenDb:Z

.field private final mContext:Landroid/content/Context;

.field public mSmileyTexts:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->sInstance:Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;

    .line 27
    const/4 v0, 0x0

    sput v0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->countDbCopy:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 32
    const-string v0, "mmsfrovider.db"

    const/4 v1, 0x0

    const/16 v2, 0x14

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->flagNeedReopenDb:Z

    .line 33
    iput-object p1, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->mContext:Landroid/content/Context;

    .line 34
    invoke-direct {p0}, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->checkDBIsExist()V

    .line 35
    return-void
.end method

.method private checkDBIsExist()V
    .locals 9

    .prologue
    .line 86
    new-instance v2, Ljava/io/File;

    const-string v7, "/data/data/com.lewa.providers.mmsfavorite/databases"

    invoke-direct {v2, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 87
    .local v2, dbDir:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 88
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 91
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v7, "/data/data/com.lewa.providers.mmsfavorite/databases/mmsfrovider.db"

    invoke-direct {v1, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 92
    .local v1, db:Ljava/io/File;
#    sget v7, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->countDbCopy:I

#    const/4 v8, 0x3

#    if-ge v7, v8, :cond_1

#    invoke-virtual {v1}, Ljava/io/File;->exists()Z

#    move-result v7

#    if-nez v7, :cond_1

    .line 94
    :try_start_0
    sget v7, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->countDbCopy:I

    add-int/lit8 v7, v7, 0x1

    sput v7, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->countDbCopy:I

    .line 95
    iget-object v7, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/high16 v8, 0x7f04

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v5

    .line 96
    .local v5, inputStream:Ljava/io/InputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    const-string v7, "/data/data/com.lewa.providers.mmsfavorite/databases/mmsfrovider.db"

    invoke-direct {v4, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 97
    .local v4, fos:Ljava/io/FileOutputStream;
    const/16 v7, 0x2000

    new-array v0, v7, [B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 98
    .local v0, buffer:[B
    const/4 v6, 0x0

    .line 100
    .local v6, temp:I
    :goto_0
    :try_start_1
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :cond_2

    .line 101
    const/4 v7, 0x0

    invoke-virtual {v4, v0, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 105
    :catch_0
    move-exception v3

    .line 106
    .local v3, e:Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 112
    .end local v0           #buffer:[B
    .end local v3           #e:Ljava/io/IOException;
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v5           #inputStream:Ljava/io/InputStream;
    .end local v6           #temp:I
    :cond_1
    :goto_1
    return-void

    .line 103
    .restart local v0       #buffer:[B
    .restart local v4       #fos:Ljava/io/FileOutputStream;
    .restart local v5       #inputStream:Ljava/io/InputStream;
    .restart local v6       #temp:I
    :cond_2
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 104
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 108
    .end local v0           #buffer:[B
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v5           #inputStream:Ljava/io/InputStream;
    .end local v6           #temp:I
    :catch_1
    move-exception v3

    .line 109
    .local v3, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1
.end method

.method private createMmsFavoriteTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 115
    const-string v0, "CREATE TABLE mms_favorite (_id INTEGER PRIMARY KEY,body TEXT,type1 INTEGER DEFAULT 0,text1 TEXT,type2 INTEGER DEFAULT 0,text2 TEXT,type3 INTEGER DEFAULT 0,text3 TEXT,count INTEGER DEFAULT 0,read INTEGER DEFAULT 1,priority INTEGER DEFAULT 0,date TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 130
    const-string v0, "CREATE TABLE mms_favorite_index (_id INTEGER PRIMARY KEY,type1 INTEGER DEFAULT 0,text1 TEXT,type2 INTEGER DEFAULT 0,text2 TEXT,type3 INTEGER DEFAULT 0,text3 TEXT,count INTEGER DEFAULT 0,order_sort INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method static declared-synchronized getInstance(Landroid/content/Context;)Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;
    .locals 2
    .parameter "context"

    .prologue
    .line 38
    const-class v1, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->sInstance:Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;

    invoke-direct {v0, p0}, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->sInstance:Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;

    .line 41
    :cond_0
    sget-object v0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->sInstance:Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public checkIfReopenDb()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 76
    iget-boolean v1, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->flagNeedReopenDb:Z

    if-eqz v1, :cond_0

    .line 77
    iput-boolean v0, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->flagNeedReopenDb:Z

    .line 78
    const/4 v0, 0x1

    .line 81
    :cond_0
    return v0
.end method

.method public deleteDB()V
    .locals 3

    .prologue
    .line 51
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/data/com.lewa.providers.mmsfavorite/databases/mmsfrovider.db"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 53
    .local v0, dbFile:Ljava/io/File;
    sget v1, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->countDbCopy:I

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 57
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter "db"

    .prologue
    .line 46
    const-string v0, "MmsFavoriteProvider"

    const-string v1, "onCreate()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 72
    const-string v0, "MmsFavoriteProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onOpen flagNeedReopenDb = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->flagNeedReopenDb:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 63
    const-string v0, "MmsFavoriteProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgrade oldVersion = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "newVersion ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-virtual {p0}, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->deleteDB()V

    .line 65
    invoke-direct {p0}, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->checkDBIsExist()V

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lewa/providers/mmsfavorite/MmsFavoriteSQLiteHelper;->flagNeedReopenDb:Z

    .line 67
    return-void
.end method
