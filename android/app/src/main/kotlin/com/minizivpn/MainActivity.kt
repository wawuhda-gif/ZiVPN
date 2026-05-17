package com.minizivpn

import android.content.Intent
import android.net.VpnService
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.minizivpn.vpn.MyVpnService

class MainActivity: FlutterActivity() {

    private val CHANNEL = "minizivpn/vpn"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                when(call.method) {
                    "connectVPN" -> {
                        val intent = VpnService.prepare(this)

                        if (intent != null) {
                            startActivityForResult(intent, 100)
                        } else {
                            startService(Intent(this, MyVpnService::class.java))
                        }

                        result.success(true)
                    }

                    "disconnectVPN" -> {
                        stopService(Intent(this, MyVpnService::class.java))
                        result.success(true)
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
