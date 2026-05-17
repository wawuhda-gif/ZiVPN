package com.minizivpn.vpn

import android.app.Service
import android.content.Intent
import android.net.VpnService
import android.os.IBinder

class MyVpnService : VpnService() {

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        val builder = Builder()
            .setSession("MiniZiVPN")
            .addAddress("10.0.0.2", 24)
            .addDnsServer("1.1.1.1")
            .addRoute("0.0.0.0", 0)

        builder.establish()

        return Service.START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? {
        return super.onBind(intent)
    }
}
