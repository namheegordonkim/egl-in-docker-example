import vispy
import os

vispy.use("egl")
from vispy import scene
from vispy import io


def main():
    canvas = scene.SceneCanvas(size=(800, 600), show=False)
    view = canvas.central_widget.add_view()
    view.camera = scene.TurntableCamera(
        up="z", fov=1.0, elevation=15.0, distance=300, azimuth=15
    )
    view.camera.rect = 0, 0, 1, 1
    _ = scene.visuals.XYZAxis(parent=view.scene)

    img = canvas.render()
    io.image.write_png(f"{os.path.dirname(os.path.abspath(__file__))}/out.png", img)
    canvas.close()


if __name__ == "__main__":
    main()
