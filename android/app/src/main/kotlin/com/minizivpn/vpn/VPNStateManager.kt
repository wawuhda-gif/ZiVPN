package com.minizivpn.vpn

object VPNStateManager {

    var isConnected = false
    var currentServer = ""

    fun connect(server: String) {
        currentServer = server
        isConnected = true
    }

    fun disconnect() {
        currentServer = ""
        isConnected = false
    }
}
