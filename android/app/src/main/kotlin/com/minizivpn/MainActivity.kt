package com.minizivpn

import android.content.Intent
import android.net.VpnService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "minizivpn/vpn"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when(call.method) {

                "startVPN" -> {

                    val intent = VpnService.prepare(this)

                    if (intent != null) {
                        startActivityForResult(intent, 100)
                    } else {
                        TunnelManager.start(this)
                    }

                    result.success(true)
                }

                "stopVPN" -> {

                    TunnelManager.stop(this)

                    result.success(true)
                }

                else -> result.notImplemented()
            }
        }
    }
}
