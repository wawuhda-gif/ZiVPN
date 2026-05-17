// File: android/app/src/main/kotlin/com/minizivpn/MyVpnService.kt

package com.minizivpn

import android.app.*
import android.content.Intent
import android.net.VpnService
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import java.io.File

class MyVpnService : VpnService() {

    private var vpnInterface: ParcelFileDescriptor? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        createNotification()

        Thread {
            startTunnel()
        }.start()

        return START_STICKY
    }

    private fun startTunnel() {

        val builder = Builder()
            .setSession("MiniZiVPN")
            .addAddress("10.0.0.2", 24)
            .addDnsServer("1.1.1.1")
            .addRoute("0.0.0.0", 0)

        vpnInterface = builder.establish()

        val binDir = File(filesDir, "bin")

        val udpBin = File(binDir, "udp-zivpn-linux-amd64")
        val tun2socks = File(binDir, "tun2socks-linux-amd64")

        udpBin.setExecutable(true)
        tun2socks.setExecutable(true)

        Runtime.getRuntime().exec(arrayOf(
            udpBin.absolutePath,
            "-server",
            "YOUR_SERVER_IP:5667",
            "-username",
            "YOUR_USERNAME",
            "-password",
            "YOUR_PASSWORD"
        ))

        Runtime.getRuntime().exec(arrayOf(
            tun2socks.absolutePath,
            "-device",
            "tun://tun0",
            "-proxy",
            "socks5://127.0.0.1:1080"
        ))
    }

    private fun createNotification() {

        val channelId = "zivpn_service"

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {

            val channel = NotificationChannel(
                channelId,
                "MiniZiVPN",
                NotificationManager.IMPORTANCE_LOW
            )

            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }

        val notification = NotificationCompat.Builder(this, channelId)
            .setContentTitle("MiniZiVPN Connected")
            .setContentText("UDP Tunnel Running")
            .setSmallIcon(android.R.drawable.stat_sys_download_done)
            .build()

        startForeground(1, notification)
    }

    override fun onDestroy() {
        vpnInterface?.close()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? {
        return super.onBind(intent)
    }
}
