package com.minizivpn.vpn

class JNIBridge {

    external fun startTun2Socks()

    external fun stopTun2Socks()

    companion object {
        init {
            try {
                System.loadLibrary("tun2socks")
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }
}
