# Play Clean Swift

## Component:
- Models
- Router
- Worker
- Interactor
- Presenter
- ViewController

## Communication:
Komunikasi antar component dilakukan dengan "Protokol". Setiap component akan berisi protocol yang akan digunakan untuk menerima dan mengirimkan data diantara mereka.
- Worker berkomunikasi dengan Interactor
- Interactor dengan Presenter, dan
- Presenter dengan ViewController
