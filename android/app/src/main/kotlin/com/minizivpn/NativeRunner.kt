package com.minizivpn

import android.content.Context
import java.io.File

object NativeRunner {

    fun prepareBinary(context: Context, binaryName: String): File {
        val outFile = File(context.filesDir, binaryName)

        if (!outFile.exists()) {
            context.assets.open("bin/$binaryName").use { input ->
                outFile.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
        }

        outFile.setExecutable(true)

        return outFile
    }
}
