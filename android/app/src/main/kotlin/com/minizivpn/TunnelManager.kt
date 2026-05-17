// File: android/app/src/main/kotlin/com/minizivpn/TunnelManager.kt

package com.minizivpn

import android.content.Context
import android.content.Intent
import android.net.VpnService

object TunnelManager {

    fun start(context: Context) {

        NativeRunner.extractBin(context, "udp-zivpn-linux-amd64")
        NativeRunner.extractBin(context, "tun2socks-linux-amd64")

        val intent = Intent(context, MyVpnService::class.java)

        context.startService(intent)
    }

    fun stop(context: Context) {

        val intent = Intent(context, MyVpnService::class.java)

        context.stopService(intent)
    }
}
