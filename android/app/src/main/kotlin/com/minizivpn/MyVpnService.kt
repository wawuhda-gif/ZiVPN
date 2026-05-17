package com.minizivpn

import android.net.VpnService

class MyVpnService : VpnService() {

    override fun onCreate() {
        super.onCreate()

        TunnelManager.setup(this)
    }
}
