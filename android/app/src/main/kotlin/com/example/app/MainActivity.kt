import android.hardware.camera2.CameraManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    private lateinit var cameraManager:  CameraManager
    private lateinit var torchButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        cameraManager = getSystemService(CAMERA_SERVICE) as CameraManager
        torchButton = findViewById(R.id.torch_button)

        torchButton.setOnClickListener {
            if (torchButton.text == "Torch On") {
                turnOffTorch()
                torchButton.text = "Torch Off"
            } else {
                turnOnTorch()
                torchButton.text = "Torch On"
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
