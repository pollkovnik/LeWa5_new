.class Lcom/lewa/player/ExitApplication$3;
.super Landroid/content/BroadcastReceiver;
.source "ExitApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lewa/player/ExitApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lewa/player/ExitApplication;


# direct methods
.method constructor <init>(Lcom/lewa/player/ExitApplication;)V
    .locals 0
    .parameter

    .prologue
    .line 155
    iput-object p1, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x3

    .line 160
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, action:Ljava/lang/String;
    const-string v6, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {p1}, Lcom/lewa/player/online/OnlineLoader;->isWiFiActive(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 162
    invoke-static {p1}, Lcom/ting/mp3/android/onlinedata/ImageManager;->init(Landroid/content/Context;)V

    .line 163
    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    iget-object v7, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->sp:Landroid/content/SharedPreferences;
    invoke-static {v7}, Lcom/lewa/player/ExitApplication;->access$000(Lcom/lewa/player/ExitApplication;)Landroid/content/SharedPreferences;

    move-result-object v7

    iget-object v8, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->edit:Landroid/content/SharedPreferences$Editor;
    invoke-static {v8}, Lcom/lewa/player/ExitApplication;->access$100(Lcom/lewa/player/ExitApplication;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/lewa/player/ExitApplication;->certify(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V

    .line 209
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    sget-object v6, Lcom/lewa/player/MusicUtils;->UPDATE_TOKEN:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 166
    new-instance v6, Lcom/lewa/player/ExitApplication$3$1;

    invoke-direct {v6, p0}, Lcom/lewa/player/ExitApplication$3$1;-><init>(Lcom/lewa/player/ExitApplication$3;)V

    invoke-virtual {v6}, Lcom/lewa/player/ExitApplication$3$1;->start()V

    goto :goto_0

    .line 184
    :cond_2
    const-string v6, "android.media.VOLUME_CHANGED_ACTION"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 185
    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v6}, Lcom/lewa/player/ExitApplication;->access$200(Lcom/lewa/player/ExitApplication;)Landroid/media/AudioManager;

    move-result-object v6

    if-nez v6, :cond_3

    .line 186
    iget-object v7, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    const-string v8, "audio"

    invoke-virtual {v6, v8}, Lcom/lewa/player/ExitApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/media/AudioManager;

    #setter for: Lcom/lewa/player/ExitApplication;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v7, v6}, Lcom/lewa/player/ExitApplication;->access$202(Lcom/lewa/player/ExitApplication;Landroid/media/AudioManager;)Landroid/media/AudioManager;

    .line 187
    :cond_3
    goto :goto_0

    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v6}, Lcom/lewa/player/ExitApplication;->access$200(Lcom/lewa/player/ExitApplication;)Landroid/media/AudioManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v6

    if-eqz v6, :cond_0

    sget-boolean v6, Lcom/lewa/player/MediaPlaybackService;->mIsSupposedToBePlaying:Z

    if-eqz v6, :cond_0

    .line 188
    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v6}, Lcom/lewa/player/ExitApplication;->access$200(Lcom/lewa/player/ExitApplication;)Landroid/media/AudioManager;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v5

    .line 189
    .local v5, volume:I
    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v6}, Lcom/lewa/player/ExitApplication;->access$200(Lcom/lewa/player/ExitApplication;)Landroid/media/AudioManager;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v2

    .line 190
    .local v2, maxVolume:I
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v3

    .line 191
    .local v3, numberFormat:Ljava/text/NumberFormat;
    const/4 v6, 0x2

    invoke-virtual {v3, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 192
    int-to-float v6, v5

    int-to-float v7, v2

    div-float/2addr v6, v7

    float-to-double v6, v6

    invoke-virtual {v3, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    .line 193
    .local v4, result:Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    float-to-double v6, v6

    const-wide v8, 0x3fe6666666666666L

    cmpl-double v6, v6, v8

    if-lez v6, :cond_0

    .line 195
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 196
    .local v1, mHandler:Landroid/os/Handler;
    iget-object v6, p0, Lcom/lewa/player/ExitApplication$3;->this$0:Lcom/lewa/player/ExitApplication;

    #getter for: Lcom/lewa/player/ExitApplication;->mToast:Landroid/widget/Toast;
    invoke-static {v6}, Lcom/lewa/player/ExitApplication;->access$300(Lcom/lewa/player/ExitApplication;)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 197
    new-instance v6, Lcom/lewa/player/ExitApplication$3$2;

    invoke-direct {v6, p0}, Lcom/lewa/player/ExitApplication$3$2;-><init>(Lcom/lewa/player/ExitApplication$3;)V

    const-wide/16 v7, 0x3e8

    invoke-virtual {v1, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0
.end method
