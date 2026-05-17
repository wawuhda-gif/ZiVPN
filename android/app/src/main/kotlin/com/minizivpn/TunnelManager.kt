package com.minizivpn

import android.content.Context

object TunnelManager {

    fun setup(context: Context) {

        NativeRunner.prepareBinary(
            context,
            "tun2socks-linux-amd64"
        )

        NativeRunner.prepareBinary(
            context,
            "udp-zivpn-linux-amd64"
        )
    }
}
