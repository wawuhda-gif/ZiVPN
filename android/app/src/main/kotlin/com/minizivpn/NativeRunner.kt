// File: android/app/src/main/kotlin/com/minizivpn/NativeRunner.kt

package com.minizivpn

import android.content.Context
import java.io.File
import java.io.FileOutputStream

object NativeRunner {

    fun extractBin(context: Context, fileName: String) {

        val outFile = File(context.filesDir, "bin/$fileName")

        outFile.parentFile?.mkdirs()

        if (!outFile.exists()) {

            val input = context.assets.open("bin/$fileName")
            val output = FileOutputStream(outFile)

            input.copyTo(output)

            input.close()
            output.close()

            outFile.setExecutable(true)
        }
    }
}
