import android.hardware.camera2.CameraManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import kotlin.concurrent.thread

class MainActivity : AppCompatActivity() {
    private lateinit var cameraManager: CameraManager
    private lateinit var torchButton: Button
    private var isTorchOn = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        cameraManager = getSystemService(CAMERA_SERVICE) as CameraManager
        torchButton = findViewById(R.id.torch_button)

        torchButton.setOnClickListener {
            if (isTorchOn) {
                turnOffTorch()
                torchButton.text = "Turn On Torch"
                isTorchOn = false
            } else {
                turnOnTorch()
                torchButton.text = "Turn Off Torch"
                isTorchOn = true
            }
        }
    }

    private fun turnOnTorch() {
        val cameraId = cameraManager.cameraIdList[0]
        cameraManager.setTorchMode(cameraId, true)
    }

    private fun turnOffTorch() {
        val cameraId = cameraManager.cameraIdList[0]
        cameraManager.setTorchMode(cameraId, false)
    }
}